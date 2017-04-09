<template>
  <ul class="pagination">
  <li v-if="cur!=1"><a v-on:click="btnPervious">Previous</a></li>
  <li v-for="index in indexs" v-bind:class="{ active: cur == index}">
      <a v-on:click="btnClick(index)">{[ index ]}</a>
  </li>
  <li v-if="cur!=all"><a v-on:click="btnNext">Next</a></li>
  <li><a>共<i>{[ all ]}</i>页</a></li>
  </ul>
</template>
<script>
module.exports = {
    props: ['cur', 'all'],
    data(){
      return {}
    },
    computed: {
        indexs: function(){
          var left = 1
          var right = this.all
          var ar = []
          if(this.all>= 11){
            if(this.cur > 5 && this.cur < this.all-4){
                    left = this.cur - 5
                    right = this.cur + 4
            }else{
                if(this.cur<=5){
                    left = 1
                    right = 10
                }else{
                    right = this.all
                    left = this.all -9
                }
            }
         }
        while (left <= right){
            ar.push(left)
            left ++
        }
        return ar
       }
    },
    methods: {
       btnClick:function(data){
           if(data != this.cur){
               this.cur = data
               this.$dispatch('btn-click',data)
           }
       },
       btnNext: function(){
            this.cur = this.cur + 1;
            this.$dispatch('btn-click', this.cur);
      },
      btnPervious: function(){
          this.cur = this.cur - 1;
          this.$dispatch('btn-click', this.cur);
      }
   }
}
</script>