﻿using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using ERPWeb.Core.Domain;
using ERPWeb.Core.Domain.System;
using MyFX.Repository.Ef;

namespace ERPWeb.Core.Repository
{
    public class SqlServerDbContext : DbContextBase
    {
        /// <summary>
        /// SqlServerDbContext
        /// </summary>
        public SqlServerDbContext(string name)
            : base(name)
        {

        }

        /// <summary>
        /// OnModelCreating
        /// </summary>
        /// <param name="modelBuilder"></param>
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
            modelBuilder.Conventions.Remove<DatabaseGeneratedAttributeConvention>();

            modelBuilder.Entity<Department>().ToTable("department");
            modelBuilder.Entity<Order>().ToTable("ORDERS");
            //自增列需要在数据库建序列+触发器配合生成
            modelBuilder.Entity<Order>().HasKey(o => o.Id);
            modelBuilder.Entity<Order>().Property(o => o.Id).HasColumnName("ORDERID");
            modelBuilder.Entity<Order>().Property(o => o.OrderNo).HasColumnName("ORDERNO");
            modelBuilder.Entity<Order>().Property(o => o.StoreId).HasColumnName("STOREID");
            modelBuilder.Entity<Order>().Property(o => o.StoreOwnerId).HasColumnName("STOREOWNERID");
            modelBuilder.Entity<Order>().Property(o => o.CustomerId).HasColumnName("CUSTOMERID");
            modelBuilder.Entity<Order>().Property(o => o.OrderType).HasColumnName("ORDERTYPE");
            modelBuilder.Entity<Order>().Property(o => o.OrderStatus).HasColumnName("ORDERSTATUS");
        }
    }
}
