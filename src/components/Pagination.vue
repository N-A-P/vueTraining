<template>
  <div id="pagination">
    <select
      class="custom-select"
      @change="$parent.$emit('pagination', currPage, size)"
      v-model="size"
    >
      <option :value="3">3</option>
      <option :value="5">5</option>
      <option :value="10">10</option>
    </select>
    <div>
      <button
        class="btn btn-link"
        @click="$parent.$emit('pagination',currPage - 1, size)"
        :disabled="currPage === 0"
      >&lt;</button>
      <button
        :class="index === currPage ? 'btn btn-primary':'btn btn-link'"
        @click="$parent.$emit('pagination',index, size)"
        v-for="(item,index) in range(totalPage)"
        :key="index"
      >{{index + 1}}</button>
      <button
        class="btn btn-link"
        @click="$parent.$emit('pagination',currPage + 1, size)"
        :disabled="currPage === totalPage - 1"
      >&gt;</button>
    </div>
  </div>
</template>
<script>
export default {
  props: ["totalPage", "currPage"],
  data() {
    return {
      size: 3
    };
  },
  methods: {
    range(totalPage) {
      return new Array(totalPage);
    }
  }
};
</script>
<style scoped>
select {
  width: 60px;
}
#pagination {
  display: flex;
  justify-content: flex-end;
}
</style>