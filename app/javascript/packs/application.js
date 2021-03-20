// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("local-time").start();

window.Rails = Rails;

import "bootstrap";
import "data-confirm-modal";

$(document).on("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip();
  $('[data-toggle="popover"]').popover();
});

// active_storage
require("active_storage/direct_uploads");
// action_text
require("trix");
require("@rails/actiontext");

// stimulus.js
import "controllers"

// vue.js
import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks';
import App from '../app.vue'

Vue.use(TurbolinksAdapter)

// components
Vue.component('app', App)

// wrap CRUD pages in vue
document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '[data-behavior="vue"]',
  })
})
