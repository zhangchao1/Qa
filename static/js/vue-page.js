var VuePagination = Vue.extend({
    template: '<div class="dataTables_paginate paging_simple_numbers"><ul class="pagination"><li v-if="cur!=1" class="paginate_button previous"><a v-on:click="btnPervious">Previous</a></li><li v-for="index in indexs"v-bind:class="{active: cur == index}"><a v-on:click="btnClick(index)">{[ index ]}</a></li><li v-if="cur!=all" class="paginate_button next"><a v-on:click="btnNext()">Next</a></li><li class="paginate_button"><a>共 {[all]} 页</a></li></ul></div>',
    props: ['cur', 'all'],
    data: {},
    computed: {
        indexs: function(){
            var left = 1;
            var right = this.all;
            var ar = [];
            if(this.all >= 11){
                if(this.cur > 5 && this.cur < this.all - 4){
                    left = this.cur - 5
                    right = this.cur + 4
                }else{
                    if( this.cur <= 5){
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
        btnClick: function(data){
            if(data != this.cur){
                this.cur = data;
                this.$dispatch('btn-click',data);
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
});
<div class="box-footer clearfix">
                        <vue-pagination :cur.sync="current_page" :all.sync="total_page" v-on:btn-click="loadData()"></vue-pagination>
                    </div>