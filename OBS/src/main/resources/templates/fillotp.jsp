

<head>
    <meta charset="UTF-8">
    <title>Add Auction Item</title>
<style>

body{
  background:#eee;
}

.bgWhite{
  background:white;
  box-shadow:0px 3px 6px 0px #cacaca;
}

.title{
  font-weight:600;
  margin-top:20px;
  font-size:24px
}

.customBtn{
  border-radius:0px;
  padding:10px;
}

form input{
  display:inline-block;
  width:50px;
  height:50px;
  text-align:center;
}
</style>
</head>
<div class="container">
  <div class="row justify-content-md-center">
      <div class="col-md-4 text-center">
        <div class="row">
          <div class="col-sm-12 mt-5 bgWhite">
            <div class="title">
              Verify OTP
            </div>

            <form action="/save" class="mt-5" method="POST" >

              <input class="otp" name="otp"  type="text" >
              <input type="submit" ></button>
            </form>


          </div>
        </div>
      </div>
  </div>
</div>
<script>

let digitValidate = function(ele){
  console.log(ele.value);
  ele.value = ele.value.replace(/[^0-9]/g,'');
}

let tabChange = function(val){
    let ele = document.querySelectorAll('input');
    if(ele[val-1].value != ''){
      ele[val].focus()
    }else if(ele[val-1].value == ''){
      ele[val-2].focus()
    }
 }


</script>
</body>