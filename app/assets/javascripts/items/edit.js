$(function(){
    // カテゴリー機能
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='category-wrapper-select' id= 'children_wrapper'>
                        <div class='category-wrapper-select__box'>
                          <select class='category-wrapper__category form-control' id="child_category" name="item[child_id]" style = "width: 100%; height: 24px;">
                            <option value="指定なし" data-category="指定なし">指定なし</option>
                            ${insertHTML}
                          <select>
                        </div>
                      </div>`;
    $('.category-wrapper-box').append(childSelectHtml);
  }
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='category-wrapper-select' id= 'grandchildren_wrapper'>
                              <div class='category-wrapper-select__box'>
                                <select class='category-wrapper__category form-control' id="grandchild_category" name="item[category_id]" style = "width: 100%; height: 24px;">
                                  <option value="指定なし" data-category="指定なし">指定なし</option>
                                  ${insertHTML}
                                <select>
                              </div>
                            </div>`;
    $('.category-wrapper-box').append(grandchildSelectHtml);
  }
  $('#parent_category').on('change', function(){
    $('#children_wrapper').remove();
    $('#grandchildren_wrapper').remove();
    var parentCategory = document.getElementById('parent_category').value;
    if (parentCategory != "指定なし" ){
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove(); 
        $('#grandchildren_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove();
      $('#grandchildren_wrapper').remove();
    }
  });
  $('.wrapper.category-wrapper').on('change', '#child_category', function(){
    $('#grandchildren_wrapper').remove();
    var childId = $('#child_category option:selected').data('category'); 
    if (childId != "指定なし"){ 
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove();
    }
  });


  
  // 複数画像
  $(window).on('load', function(e){
    var fileIndex = [1,2,3,4,5,6,7,8,9,10];
    var previewCount = $('.preview').length;
    lastIndex = $('.js-file_group:last').data('index');
    fileIndex.splice(0, lastIndex);
    $('.hidden-destroy').hide();


    $(document).on('change', '.js-file_group input', function(e) {
      $('.preview').parent().removeClass("img_field");
      var id = $('.img_field').attr('id').replace(/[^0-9]/g, '');
      var file = e.target.files[0];
      var reader = new FileReader();
      var newImgId = `#img_field--${id}`;
      var preview = $(newImgId);
      preview.attr({id: `img_field--${id}`});
      reader.onload = (function(file) {
        return function(e) {
          preview.empty();
          preview.append($('<img>').attr({
            src: e.target.result,
            width: "100px",
            height: "100%",
            class: "preview",
            title: file.name
          }));
        };
      })(file);
      preview.removeClass('img_field');
      reader.readAsDataURL(file);
    });

    const buildFileField = function(index){
      var html = `<div class="image-wrapper__image-box__js js-file_group" data-index="${index}">
                    <label class="image-wrapper__image-box__js__label" for="item_images_attributes_${index}_content">
                      <div class="image-wrapper__image-box__js__label__image img_field" data-image="${index}" id="img_field--${index}" onclick="$('#file').click()">
                        <img class="image-wrapper__image-box__js__label__image__url" id="default-img" src="/assets/icon_camera-24c5a3dec3f777b383180b053077a49d0416a4137a1c541d7dd3f5ce93194dee.png">
                      </div>
                      <input class="image-wrapper__image-box__js__label__file js-file" id="item_images_attributes_${index}_content" type="file" name="item[images_attributes][${index}][content]">
                    </label>
                    <div class="js-remove" data-remove="${index}">
                      <span class="js-remove__text">
                        削除
                      </span> 
                    </div>
                  </div>`;
      return html;
    }


    $('#image-box').on('change', '.js-file', function(e){
      if( previewCount < 9 || $('#default-img').length == 0) {
        $('#image-box').append(buildFileField(fileIndex[0]));
        fileIndex.shift();
        fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
      }
    });

    $('#image-box').on('click', '.js-remove', function(){
      const targetIndex = $(this).parent().data('index');
      const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
      if (hiddenCheck){ 
        hiddenCheck.prop('checked', true);
      }
      $(this).parent().remove();
      if ($('.js-file').length == 0 || $('#default-img').length == 0){
        $('#image-box').append(buildFileField(fileIndex[0]));
      };
    });
  });

  //値段制限

  const priceLess = function(){
    var html = `<div class="price-wrapper__alert" id="price-less" style="float: right; color: red; margin-right: 40px;"><p>300円以上で設定してください</p></div>`
    return html;
  }

  const priceMore = function(){
    var html = `<div class="price-wrapper__alert" id="price-more" style="float: right; color: red; margin-right: 40px;"><p>2,000,000円以内で設定してください</p></div>`
    return html;
  }

  $('input[type="number"]').on('focusout', function(){
    var num = $('.price-wrapper__label__price').val();
    if (num < 300 && num >= 0){
      if ($('#price-less').length == 0 || $('#price-more').length != 0 ){
        $('#price-more').remove();
        $('.price-wrapper').append(priceLess);
      }
    }
    else if (num >= 300 && num <= 2000000){
      $('.price-wrapper__alert').remove();
    }
    else if (num > 2000000){
      if ($('#price-more').length == 0 || $('#price-less').length != 0){
        $('#price-less').remove();
        $('.price-wrapper').append(priceMore);
      }
    }
    else {
      $('.price-wrapper__alert').remove();
    }

  })
});