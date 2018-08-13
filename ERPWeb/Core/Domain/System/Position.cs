using MyFX.Core.Domain.Entities;

namespace ERPWeb.Core.Domain.System
{
    public class Position : AggregateRoot<int>
    {
        /// <summary>
        /// 上级岗位
        /// </summary>
        public int ParentId { get; set; }

        /// <summary>
        /// 岗位名称
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 所属部门
        /// </summary>
        public int DepartmentId { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        public string Remark { get; set; }
    }
}