if (document.URL.match( /new/) || document.URL.match( /edit/)) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById("image-list");

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div'); //表示するためのdiv要素生成
      const bolbImage = document.createElement('img'); //表示する画像生成（setするコード）
      bolbImage.setAttribute('src', blob);

      //あるべき要素に子要素としてHTMlコード追加（表示）
      imageElement.appendChild(bolbImage);
      ImageList.appendChild(imageElement);
    }

    document.getElementById("item-image").addEventListener('change', function(e){
      const imageContent = ImageList.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file); //fileのURLを作成

      createImageHTML(blob);
    })
  })
}