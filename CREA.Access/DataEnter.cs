using AutoMapper;
using CREA.Access.DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CREA.Access.Extension;

namespace CREA.Access
{
    public class DataEnter : DataFeed
    {
        private CREADBEntities dbContext;
        public DataEnter()
        {
            dbContext = new CREADBEntities();
        }
        public void SaveProperty()
        {
            var model = GetProperty();
            foreach (var property in model)
            {
                Mapper.CreateMap<BuildingModel, Building>();
                var build= Mapper.Map<BuildingModel, Building>(property.Building);
                dbContext.Buildings.Add(build);
                dbContext.SaveChanges();
                property.BuildingID = build.BuildingID;

                Mapper.CreateMap<LandModel, Land>().IgnoreAllVirtual();
                var land = Mapper.Map<LandModel, Land>(property.Land);
                dbContext.Lands.Add(land);
                dbContext.SaveChanges();
                property.LandID = land.LandID;

                Mapper.CreateMap<PropertyModel, Property>().ForMember(st => st.Photos, opt => opt.Ignore()).ForMember(so=>so.PropertyAgents,ot=>ot.Ignore());
                var pro = Mapper.Map<PropertyModel, Property>(property);
                dbContext.Properties.Add(pro);
                int i = dbContext.SaveChanges();
                var propertyid = pro.PropertyID;
                foreach (var agent in property.Agents)
                {
                    var ofic=dbContext.Offices.Where(of => of.OfficeID == agent.Office.OfficeID).FirstOrDefault();
                    if (ofic==null)
                    {
                        Mapper.CreateMap<OfficeModel, Office>().IgnoreAllVirtual();
                        var offic = Mapper.Map<OfficeModel, Office>(agent.Office);
                        dbContext.Offices.Add(offic);
                        dbContext.SaveChanges();
                    }
                    var agid=dbContext.Agents.Where(at => at.AgentDetailsID == agent.AgentDetailsID).FirstOrDefault();
                    int agenid = 0;
                    if (agid==null)
                    {
                        Mapper.CreateMap<AgentModel, Agent>().IgnoreAllVirtual();
                        var age = Mapper.Map<AgentModel, Agent>(agent);
                        dbContext.Agents.Add(age);
                        dbContext.SaveChanges();
                        agenid = age.AgentID;
                    }
                    else
                    {
                        agenid = agid.AgentID;
                    }
                    var proagg=dbContext.PropertyAgents.Where(st => st.PropertyID == propertyid && st.AgentID == agenid).FirstOrDefault();
                    if (proagg==null)
                    {
                        PropertyAgent proag = new PropertyAgent();
                        proag.PropertyID = propertyid;
                        proag.AgentID = agenid;
                        dbContext.PropertyAgents.Add(proag);
                        dbContext.SaveChanges();
                    }
                }
                foreach (var phos in property.Photos)
                {
                    Mapper.CreateMap<PhotoModel, Photo>().IgnoreAllVirtual();
                    var phot= Mapper.Map<PhotoModel, Photo>(phos);
                    phot.PropertyID = propertyid;
                    dbContext.Photos.Add(phot);
                    dbContext.SaveChanges();
                }
            }
        }
    }
}