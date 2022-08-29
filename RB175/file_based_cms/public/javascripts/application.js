$(() => {
  $("a.delete").on("click", event => {
    const clickedID = event.target.id;
    const account = clickedID.split("-")[1];

    let request = $.ajax({
      method: "delete",
      url: `/users/${account}`,
    });
    request.done((data, status, jqXHR) => {
      if (jqXHR.status === 204) {
        $(`#usr_row_${account}`).remove();
      }
    });
  });
});
