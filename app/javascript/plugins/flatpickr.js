import flatpickr from "flatpickr";
import 'flatpickr/dist/themes/airbnb.css'

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    altInput: true
  });
}

export { initFlatpickr };
