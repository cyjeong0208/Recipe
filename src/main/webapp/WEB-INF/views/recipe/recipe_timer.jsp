<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>Timer</title>
  

<style>
#time {
  display: block;
  width: 20%;
  height: 10%;
  text-align: center;
  border-radius: 4px;
  position: fixed;
  bottom: 40%;
  right: 1%;
  font-size:3.0rem;
  opacity: 0;
  visibility: hidden;
  z-index: 6000;
}@media (max-width:500px){
	#time{
		display:none;
	}
}
#time::after {

  font-family: FontAwesome;
  font-weight: normal;
  font-style: normal;
  font-size:3.0rem;
  line-height: 1%;
 
}
#time:hover {
  cursor: pointer;
}

#time.show {
  opacity: 1;
  visibility: visible;
}

</style> 
  
</head>

<body>

      <div class=" text-center" id="time">
        
        <!-- Timer -->

        <div class="timer" style="color:#939393;">
            <span class="minutes">00</span> : <span class="seconds">00</span>
        </div>        

        <!-- Timer Buttons -->
            <div class="timer-buttons">
                <button class="btn btn-lg btn-success" data-action="start"> <!-- Data- Allows you to create custome HTML elements for Js purposes -->
                    Start
                </button>
                <button class="btn btn-lg btn-danger" data-action="stop">
                    Stop
                </button>
                <button class="btn btn-link btn-block" data-action="reset">
                    Reset
                </button>
            </div>
    </div>
  
  

    <script  src="/resources/js/Timejs.js"></script>

<script>

$(window).scroll(function() {
    if ($(document).scrollTop() > 1) {
      $('#time').addClass('show');
    } else {
      $('#time').removeClass('show');
    }
  });

</script>


</body>

</html>
