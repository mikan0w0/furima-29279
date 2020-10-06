if (document.URL.match( /new/) || document.URL.match( /edit/)) {
  document.addEventListener('DOMContentLoaded', function(){

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div'); //表示するためのdiv要素生成
      imageElement.setAttribute('id', "imageElement") //div要素にimageElementというidをつける
      let imageElementNum = document.querySelectorAll('#image-element').length //つけたidが何個あるかをNumに代入

      const bolbImage = document.createElement('img'); //表示する画像生成（setするコード）
      bolbImage.setAttribute('src', blob);
      bolbImage.setAttribute('class', 'gazou'); //属性の設定


      const inputHTML = document.createElement('input'); //ファイル選択ボタン生成
      inputHTML.setAttribute('id', `item_image_${imageElementNum}`); //numの数字がidtとなる
      inputHTML.setAttribute('name', 'item[images][]');
      inputHTML.setAttribute('type', 'file'); //属性の設定

      if (document.getElementById("item-image")) {
        document.getElementById("item-image").setAttribute('type', 'hidden');
      }

      //あるべき要素に子要素としてHTMlコード追加（表示）
      const ImageList = document.getElementById("image-list");
      imageElement.appendChild(bolbImage); //イメージファイルのURL
      imageElement.appendChild(inputHTML); //表示するdivにinputボタンを
      ImageList.appendChild(imageElement); //親になるエレメントに

      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);
        inputHTML.setAttribute('type', 'hidden')
        createImageHTML(blob)
      })
    }

    document.getElementById("item-image").addEventListener('change', function(e){


      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file); //fileのURLを作成

      createImageHTML(blob);
    });
  });
}