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

    var file = $('#file')[0].files[0]

    if (typeof file != "undefined"){

      // code here


    } else {
      return alert("Please select a file to upload")
    }

    data.append('file', file);



    // console.log(f === true)

    // console.log(data.length);



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
