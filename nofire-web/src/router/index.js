import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

/* Layout */
import Layout from '@/layout'

/**
 * Note: sub-menu only appear when route children.length >= 1
 * Detail see: https://panjiachen.github.io/vue-element-admin-site/guide/essentials/router-and-nav.html
 *
 * hidden: true                   if set true, item will not show in the sidebar(default is false)
 * alwaysShow: true               if set true, will always show the root menu
 *                                if not set alwaysShow, when item has more than one children route,
 *                                it will becomes nested mode, otherwise not show the root menu
 * redirect: noRedirect           if set noRedirect will no redirect in the breadcrumb
 * name:'router-name'             the name is used by <keep-alive> (must set!!!)
 * meta : {
    roles: ['admin','editor']    control the page roles (you can set multiple roles)
    title: 'title'               the name show in sidebar and breadcrumb (recommend set)
    icon: 'svg-name'/'el-icon-x' the icon show in the sidebar
    breadcrumb: false            if set false, the item will hidden in breadcrumb(default is true)
    activeMenu: '/example/list'  if set path, the sidebar will highlight the path you set
  }
 */

/**
 * constantRoutes
 * a base page that does not have permission requirements
 * all roles can be accessed
 */
export const constantRoutes = [
  {
    path: '/login',
    component: () => import('@/views/login/index'),
    hidden: true
  },

  {
    path: '/404',
    component: () => import('@/views/404'),
    hidden: true
  },

  {
    path: '/',
    component: Layout,
    redirect: '/dashboard',
    children: [{
      path: 'dashboard',
      name: 'Dashboard',
      component: () => import('@/views/dashboard/index'),
      meta: { title: '监控中心', icon: 'dashboard' }
    }]
  },

  {
    path: '/info',
    component: Layout,
    redirect: '/info/alarm',
    name: 'info',
    meta: { title: '信息管理', icon: 'el-icon-s-help' },
    children: [
      {
        path: 'alarm',
        name: 'Alarm',
        component: () => import('@/views/tablex/index'),
        meta: { title: '报警记录', icon: 'table' }
      },
      {
        path: 'company',
        name: 'Company',
        component: () => import('@/views/table/index'),
        meta: { title: '公司信息', icon: 'table' }
      },
      {
        path: 'device',
        name: 'Device',
        component: () => import('@/views/table/index'),
        meta: { title: '消防设施', icon: 'table' }
      },
      {
        path: 'part',
        name: 'Part',
        component: () => import('@/views/table/index'),
        meta: { title: '消防部件', icon: 'table' }
      },
      {
        path: 'building',
        name: 'Building',
        component: () => import('@/views/table/index'),
        meta: { title: '建筑信息', icon: 'table' }
      },
      {
        path: 'keyPart',
        name: 'KeyPart',
        component: () => import('@/views/table/index'),
        meta: { title: '重点部位', icon: 'table' }
      },
      {
        path: 'people',
        name: 'People',
        component: () => import('@/views/table/index'),
        meta: { title: '人员管理', icon: 'table' }
      },
      {
        path: 'unitType',
        name: 'UnitType',
        component: () => import('@/views/table/index'),
        meta: { title: '单位类型', icon: 'table' }
      },
      {
        path: 'equipment',
        name: 'Equipment',
        component: () => import('@/views/table/index'),
        meta: { title: '设备类型', icon: 'table' }
      },
      {
        path: 'protocol',
        name: 'Protocol',
        component: () => import('@/views/table/index'),
        meta: { title: '协议管理', icon: 'table' }
      },
      {
        path: 'role',
        name: 'Role',
        component: () => import('@/views/table/index'),
        meta: { title: '消防法规', icon: 'table' }
      },
      {
        path: 'norm',
        name: 'Norm',
        component: () => import('@/views/table/index'),
        meta: { title: '消防常识', icon: 'table' }
      },
      {
        path: 'microsite',
        name: 'Microsite',
        component: () => import('@/views/table/index'),
        meta: { title: '微站信息', icon: 'table' }
      },
      {
        path: 'hydrant',
        name: 'Hydrant',
        component: () => import('@/views/table/index'),
        meta: { title: '市政消火栓', icon: 'table' }
      }
    ]
  },

  {
    path: '/form',
    component: Layout,
    redirect: '/form/notificationquery',
    name: 'Form',
    meta: { title: '历史记录', icon: 'el-icon-s-order' },

    children: [
      {
        path: 'notificationquery',
        name: 'Notificationquery',
        component: () => import('@/views/table/index'),
        meta: { title: '通知查询', icon: 'form' }
      },
      {
        path: 'inspectionrecord',
        name: 'Inspectionrecord',
        component: () => import('@/views/table/index'),
        meta: { title: '巡检记录', icon: 'form' }
      },
      {
        path: 'operationlog',
        name: 'Operationlog',
        component: () => import('@/views/table/index'),
        meta: { title: '操作日志', icon: 'form' }
      },
      {
        path: 'cardmanagement',
        name: 'Cardmanagement',
        component: () => import('@/views/table/index'),
        meta: { title: '卡类管理', icon: 'form' }
      },
      {
        path: 'maintenancerecord',
        name: 'Maintenancerecord',
        component: () => import('@/views/table/index'),
        meta: { title: '维保记录', icon: 'form' }
      },
      {
        path: 'postcheckingrecord',
        name: 'Postcheckingrecord',
        component: () => import('@/views/table/index'),
        meta: { title: '查岗记录', icon: 'form' }
      },
      {
        path: 'acceptancerecord',
        name: 'Acceptancerecord',
        component: () => import('@/views/table/index'),
        meta: { title: '受理记录', icon: 'form' }
      },
      {
        path: 'equipmentoperation',
        name: 'Equipmentoperation',
        component: () => import('@/views/table/index'),
        meta: { title: '设备操作', icon: 'form' }
      },
      {
        path: 'devicedata',
        name: 'Devicedata',
        component: () => import('@/views/table/index'),
        meta: { title: '设备数据', icon: 'form' }
      }
    ]
  },

  {
    path: '/nested',
    component: Layout,
    redirect: '/nested/history',
    name: 'Nested',
    meta: {
      title: '报表统计',
      icon: 'el-icon-s-data'
    },
    children: [
      {
        path: 'history',
        name: 'History',
        component: () => import('@/views/table/index'),
        meta: { title: '历史状态查询', icon: 'link' }
      },
      {
        path: 'alarmRecord',
        name: 'AlarmRecord',
        component: () => import('@/views/table/index'),
        meta: { title: '报警记录报表', icon: 'link' }
      },
      {
        path: 'electricPower',
        name: 'ElectricPower',
        component: () => import('@/views/table/index'),
        meta: { title: '电功率记录报表', icon: 'link' }
      },
      {
        path: 'unitSystem',
        name: 'UnitSystem',
        component: () => import('@/views/table/index'),
        meta: { title: '单位系统异常率', icon: 'link' }
      },
      {
        path: 'checkPostAnalysis',
        name: 'checkPostAnalysis',
        component: () => import('@/views/table/index'),
        meta: { title: '查岗分析', icon: 'link' }
      },
      {
        path: 'communication',
        name: 'Communication',
        component: () => import('@/views/table/index'),
        meta: { title: '通讯系统查询', icon: 'link' }
      },
      {
        path: 'eventAnalysis',
        name: 'EventAnalysis',
        component: () => import('@/views/table/index'),
        meta: { title: '事件分析', icon: 'link' }
      }
    ]
  },

  {
    path: 'external',
    component: Layout,
    redirect: '/external/roleManagement',
    name: 'External',
    meta: {
      title: '系统管理',
      icon: 'el-icon-s-operation'
    },
    children: [
      {
        path: 'roleManagement',
        name: 'RoleManagement',
        component: () => import('@/views/table/index'),
        meta: { title: '角色管理', icon: 'table' }
      },
      {
        path: 'authorityManagement',
        name: 'AuthorityManagement',
        component: () => import('@/views/table/index'),
        meta: { title: '权限管理', icon: 'table' }
      },
      {
        path: 'columnManagement',
        name: 'ColumnManagement',
        component: () => import('@/views/table/index'),
        meta: { title: '栏目管理', icon: 'table' }
      },
      {
        path: 'logManagement',
        name: 'LogManagement',
        component: () => import('@/views/table/index'),
        meta: { title: '日志管理', icon: 'table' }
      }
    ]
  },

  // 404 page must be placed at the end !!!
  { path: '*', redirect: '/404', hidden: true }
]

const createRouter = () => new Router({
  // mode: 'history', // require service support
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRoutes
})

const router = createRouter()

// Detail see: https://github.com/vuejs/vue-router/issues/1234#issuecomment-357941465
export function resetRouter() {
  const newRouter = createRouter()
  router.matcher = newRouter.matcher // reset router
}

export default router
