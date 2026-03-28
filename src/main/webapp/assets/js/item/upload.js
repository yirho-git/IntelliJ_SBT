
 document.addEventListener("DOMContentLoaded", () => {

     const inputFile = document.querySelector(`input[name="inputFile"]`);

     inputFile.addEventListener("change", async (e) => {
         let files = e.target.files;
         let file = files[0];

         let formData = new FormData();
         formData.append("file", file);

         try {
             const resp = await fetch("/item/uploadFile",{
                 method : "post",
                 body : formData
             });

             const data = await resp.text();
             console.log("data = resp.text() = > ", data);
         }catch (error) {
             console.log("error = " + error);
         }
     });
});