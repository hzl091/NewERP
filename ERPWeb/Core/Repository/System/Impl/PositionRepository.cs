using ERPWeb.Core.Domain.System;

namespace ERPWeb.Core.Repository.System.Impl
{
    public class PositionRepository : RepositoryBase<Position, int>, IPositionRepository
    {
        public override Position GetByKey(int id)
        {
            throw new global::System.NotImplementedException();
        }
    }
}