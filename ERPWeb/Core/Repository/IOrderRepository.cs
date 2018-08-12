using ERPWeb.Core.Domain;
using MyFX.Core.DI;
using MyFX.Core.Domain.Repositories;

namespace ERPWeb.Core.Repository
{
    public interface IOrderRepository : IRepository<Order, int>, IDependency
    {
    }
}
