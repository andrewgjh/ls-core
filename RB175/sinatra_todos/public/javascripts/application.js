$(function () {
  $("form.delete").submit(function (event) {
    event.preventDefault();
    event.stopPropagation();
    console.log(this);

    let ok = confirm("Are you sure? This cannot be undone!");
    if (ok) {
      // this.submit();
      const form = $(this);
      let request = $.ajax({
        url: form.attr("action"),
        method: form.attr("method"),
      });

      request.done((data, textStatus, jqXHR) => {
        if (jqXHR.status === 204) {
          form.parent("li").remove();
        } else if (jqXHR.status === 200) {
          document.location = data;
        }
      });
    }
  });
});
