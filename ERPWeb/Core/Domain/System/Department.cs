using MyFX.Core.Domain.Entities;

namespace ERPWeb.Core.Domain.System
{
    public class Department : AggregateRoot<int>
    {
        /// <summary>
        /// 上级部门
        /// </summary>
        public int ParentId { get; set; }

        /// <summary>
        /// 名字
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        public string Remark { get; set; }

        /// <summary>
        /// 部门岗位
        /// </summary>
        //public ICollection<Position> Positions { get; set; }

        /// <summary>
        /// 子部门
        /// </summary>
        //public ICollection<Department> ChildDepartments { get; set; }
    }
}