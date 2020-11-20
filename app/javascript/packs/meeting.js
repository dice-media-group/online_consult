// pet stuff
// var FormStuff = {

//   init: function() {
//     this.applyConditionalRequired();
//     this.bindUIActions();
//   },

//   bindUIActions: function() {
//     $("input[type='radio'], input[type='checkbox']").on("change", this.applyConditionalRequired);
//   },

//   applyConditionalRequired: function() {

//     $(".require-if-active").each(function() {
//       var el = $(this);
//       if ($(el.data("require-pair")).is(":checked")) {
//         el.prop("required", true);
//       } else {
//         el.prop("required", false);
//       }
//     });

//   }

// };

// FormStuff.init();

// calendar
// Set moment for ISO-8601, Europe
moment.updateLocale("en", {
  week: {
    dow: 1, // First day of week is Monday
    doy: 4, // First week of year must contain 4 January (7 + 1 - 4)
  },
});

// Start the magic with Vue
const app = new Vue({
  el: "#calendar",
  data() {
    return {
      weekdays: moment.weekdaysShort(true),
      firstDayOfMonth: moment().startOf("month"),
      selectedDay: undefined,
    };
  },
  computed: {
    daysOfMonth() {
      return [...Array(this.firstDayOfMonth.daysInMonth())].map((_, i) => {
        return this.firstDayOfMonth.clone().add(i, "day");
      });
    },
  },
  methods: {
    column(index) {
      if (index === 0) {
        return this.daysOfMonth[0].weekday() + 1;
      }
    },
    today(day) {
      return moment().isSame(day, "day");
    },
    selectDay(day) {
      this.selectedDay = day;
    },
    isSelected(day) {
      return moment(this.selectedDay).isSame(day, "day");
    },
    changeMonth(step) {
      this.firstDayOfMonth = this.firstDayOfMonth.clone().add(step, "M");
    },
  },
});
