using System;
using System.Data.Entity;
using MyFX.Core;

namespace ERPWeb.Core.Repository
{
    public static class EFDbContextFactory
    {
        /// <summary>
        /// 获取当前调用上下文的<see cref="EFDbContext"/>实例，可写可读。
        /// </summary>
        /// <returns></returns>
        public static DbContext GetDbContext()
        {
            const string dbContextName = "con";
            SqlServerDbContext dbContext = InvokeContext.Get<SqlServerDbContext>(dbContextName);
            if (dbContext == null)
            {
                dbContext = new SqlServerDbContext(dbContextName);
                InvokeContext.Add<SqlServerDbContext>(dbContextName, dbContext);
            }

            dbContext.Database.Log = Console.WriteLine; //日志监控设置
            return dbContext;
        }
    }
}
