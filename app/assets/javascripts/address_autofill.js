$(function () {
  $(document).on('turbolinks:load', () => {
    $('#customer_postcode').jpostal({
      postcode: ['#customer_postcode'],
      address: {"#customer_address": "%3%4%5%6%7"}
    });
  });
});