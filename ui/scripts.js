$(function () {
  function _hideAll() {
    $("#container").hide();
    $("#parkOut").hide();
    $("#parkIn").hide();
  }

  function _showAll() {
    $("#container").show();
  }

  _hideAll();

  window.addEventListener("message", (event) => {
    const item = event.data;
    if (item.open) {
      _showAll();

      item.data.forEach((data) => {
        if(data.stored === 1) {
            $("#cars").append(`
            <div class="car">
                <p>${data.plate}</p>
            </div>
            `);
        } else return;
      });
    } else {
      _hideAll();
    }
  });

  $("#closeBtn").click(() => {
    $.post("https://ug_garage/close", JSON.stringify({}));
    return;
  });

  $("#parkOutBtn").click(() => {
    $("#parkOut").show();
    $("#parkIn").hide();
  });

  $("#parkInBtn").click(() => {
    $("#parkIn").show();
    $("#parkOut").hide();
  });
});
