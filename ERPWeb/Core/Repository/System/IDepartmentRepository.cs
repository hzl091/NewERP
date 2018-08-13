using ERPWeb.Core.Domain.System;
using MyFX.Core.DI;
using MyFX.Core.Domain.Repositories;

namespace ERPWeb.Core.Repository.System
{
    public interface IDepartmentRepository : IRepository<Department, int>, IDependency
    {
    }
}