using ERPWeb.Core.Domain.System;

namespace ERPWeb.Core.Repository.System.Impl
{
    public class DepartmentRepository : RepositoryBase<Department, int>, IDepartmentRepository
    {
        public override Department GetByKey(int id)
        {
            throw new global::System.NotImplementedException();
        }
    }
}