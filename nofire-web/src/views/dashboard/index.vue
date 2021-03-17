<template>
  <div class="dashboard-container">
    <component :is="currentRole" />
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import echartsmain from '@/views/dashboard/echartsMain/echartsmain'

export default {
  name: 'Dashboard',
  components: { echartsmain },
  data() {
    return {
      currentRole: 'echartsmain'
    }
  },
  computed: {
    ...mapGetters([
      'roles'
    ])
  }

}
</script>
