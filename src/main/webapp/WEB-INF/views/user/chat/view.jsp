<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	#title+p {
		text-shadow: 0 2px 10px rgba(255, 255, 255, 0.8);
		padding: 5px 20px;
		color: #222222;
		font-size: 17px;
		background-color: rgba(255, 255, 255, 0.6);
		display: inline-block;
		border-radius: 50px;
	}
	
	#pagetitle {
		margin-top: 70px;
	}
	#title {
	  margin-bottom: 20px;
	}
	
	.munti-content-container {
	  display: flex;
	  flex-wrap: wrap;
	  margin: 30px 50px 0 50px;
	  padding: 0 !important;
	}
	
	.item {
	  position: relative;
	  width:1200px; 
	  height:300px;
	  aspect-ratio: 0.75;
	  padding: 0;
	  box-sizing: border-box;
	  min-width: 270px;
	  border: 1px solid #E1E1E1;
	  margin: 10px 45px 50px 45px;
	  border-radius: 10px;
	  /* transition: all 0.3s; */
	   box-shadow: 12px 12px 17px rgba(0, 0, 0, 0.20);
	}
	
	.item>div:nth-child(1) {
	  height: 70%;
	  background-color: transparent;
	  background-size: cover;
	  background-position: center;
	  background-repeat: no-repeat;
	  border-radius: 10px 10px 0 0;
	}
	
	.item>div:nth-child(2) {
	  height: 30%;
	  display: flex;
	  flex-direction: column;
	  padding: 20px;
	  font-size: 1.3rem;
	  font-weight: bold;
	  background: transparent;
	  border-radius: 0 0 10px 10px;
	}
	.hidden-div {
	      display: block;
	      color: white;
	      position: absolute;
	      top: 0;
	      left: 0;
	      width: 100%;
	      height: 70%;
	      padding: 20px;
	      background-color: black;
	      /* opacity: 0.65; /* 투명도 조절 */ */
	      border-radius: 10px 10px 0 0;
	      z-index: 1; /* 다른 요소들보다 위에 위치하도록 설정 */
	}
	.stats-counter {
       background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("/dd/resources/files/chat/chat.jpg") center center;
       background-size: cover;
       background-attachment: fixed;
    }
</style>
    <!-- ======= Stats Counter Section ======= -->
    <section id="stats-counter" class="stats-counter">
      <div id="pagetitle" class="container" data-aos="zoom-out">
        <div class="gy-4" style="justify-content: center; width: 100%;">

          <div class="col-lg-3 col-md-6" style="width: 100%;">
            <div class="stats-item text-center w-100 h-100">
              <div id="title" style="font-size: 48px;
              display: block;
              color: #fff;
              font-weight: 700;">OpenChat</div>
              <p>자유롭게 정보를 공유하세요!</p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- End Stats Counter Section -->

    <!-- ======= Menu Section ======= -->
    <section id="menu" class="menu">
      <div class="container" data-aos="fade-up">

        <div class="tab-content" data-aos-delay="900">

          <div class="tab-pane fade active show" id="menu-starters">

				<div>
					<div class="group">
						<label>대화명</label> <input type="text" name="name" id="name"
							class="short">
					</div>
				</div>

				<div>
					<button type="button" class="in">들어가기</button>
				</div>
 
			</div><!-- End Starter Menu Content -->
      </div>
     </div>
    </section><!-- End Menu Section -->
    
     <script>
	    $('.in').click(function() {
			
			let name = $('#name').val();
			
			if($(event.target).data('name') != null && $(event.target).data('name') != '') {
				name = $(event.target).data('name');
			}
			
			let child = window.open('/dd/user/chat/chat.do', 'chat', 'width=404 height=515');
			
			child.addEventListener('load', function() {
				//자식창 다 뜨고 나면 발생
				child.connect(name);
			});
			
			$('.in').css('opacity', .5)
					.prop('disabled', true);
			$('#name').prop('readOnly', true);
		});	

  </script>
    
 