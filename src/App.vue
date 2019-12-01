<template>
  <div id="app" class="container mt-5">
    <router-view
      :cart="cart"
      :cartQty="cartQty"
      :cartTotal="cartTotal"
      :sliderStatus="sliderStatus"
      :maximum.sync="maximum"
      :products="productPage"
      :currPage="currPage"
      :totalPage="totalPage"
      @add="addItem"
      @delete="deleteItem"
      @pagination="pagination(...arguments)"
      @toggle="toggleSliderStatus"
    ></router-view>
  </div>
</template>

<script>
export default {
  name: "app",
  data: function() {
    return {
      maximum: 99,
      productPage: [],
      currPage: 0,
      pageSize: 4,
      totalPage: 1,
      sliderStatus: true,
      cart: [],
      products: null
    };
  },
  computed: {
    cartTotal: function() {
      let sum = 0;
      for (let key in this.cart) {
        sum = sum + this.cart[key].product.price * this.cart[key].qty;
      }
      return sum;
    },
    cartQty: function() {
      let qty = 0;
      for (let key in this.cart) {
        qty = qty + this.cart[key].qty;
      }
      return qty;
    }
  },
  methods: {
    toggleSliderStatus: function() {
      this.sliderStatus = !this.sliderStatus;
    },
    deleteItem: function(id) {
      if (this.cart[id].qty > 1) {
        this.cart[id].qty--;
      } else {
        this.cart.splice(id, 1);
      }
    },
    pagination(currPage, pageSize) {
      this.totalPage = Math.floor(this.products.length / pageSize);
      this.currPage = currPage;
      this.pageSize = pageSize;
      this.productPage = [];
      for (let i = currPage * pageSize, size = pageSize + i; i < size; i++) {
        if (i < this.products.length) this.productPage.push(this.products[i]);
      }
    },
    addItem: function(product) {
      var whichProduct;
      var existing = this.cart.filter(function(item, index) {
        if (item.product.id == Number(product.id)) {
          whichProduct = index;
          return true;
        } else {
          return false;
        }
      });

      if (existing.length) {
        this.cart[whichProduct].qty++;
      } else {
        this.cart.push({ product: product, qty: 1 });
      }
    }
  },
  created: function() {
    fetch("https://hplussport.com/api/products/order/price")
      .then(response => response.json())
      .then(data => {
        this.products = data;
        this.pagination(this.currPage, this.pageSize);
        this.totalPage = Math.floor(this.products.length / this.pageSize);
      });
  }
};
</script>