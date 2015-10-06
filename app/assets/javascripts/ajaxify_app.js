// console.log("from ajaxify")


// function addDetention () {
//   $("form").on("submit", function(event){
//     event.preventDefault();
//     console.log("binded");
//
//     console.log(event)
//
//   });
// }

function uploadCSV () {
  $(document).on("submit", "form", function(event){
    event.preventDefault();

    console.log("bound");

    var data;

    data = new FormData();
    data.append('file', $('#file')[0].files[0]);

    console.log(data);


    var request = $.ajax({
      type: 'post',
      url: '/teachers/upload',
      data: data,
      processData: false,
      contentType: false,
    });

    request.done(function(response){
      console.log("response done")
    });

    request.error(function(response) {
      console.log("error");
      console.log(response);
    });


  });
}
