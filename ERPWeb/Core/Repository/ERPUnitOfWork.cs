using System;
using System.Data.Entity;
using MyFX.Repository;
using MyFX.Repository.Ef;

namespace ERPWeb.Core.Repository
{
    public class ERPUnitOfWork : EFUnitOfWork
    {
        public override DbContext Context
        {
            get { return EFDbContextFactory.GetDbContext(); }
            set {  }
        }
    }
}
