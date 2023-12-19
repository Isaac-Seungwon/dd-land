<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!-- ======= Main ======= -->
	<main id="main" class="main">
	
		<section id="reveal">
			<div class="reveal-container" data-aos="fade-in">
				<p><span class="typed" data-typed-items="안녕하세요 관리자님! 오늘도 즐거운 DD Land를 만들러가볼까요?"></span></p>
			</div>
		</section>	

    	<script>
			const typed = document.querySelector('.typed');
			
			if (typed) {
				let typed_strings = typed.getAttribute('data-typed-items');
				typed_strings = typed_strings.split(',');
				
				new Typed('.typed', {
					strings : typed_strings,
					loop : true,
					typeSpeed : 100,
					backSpeed : 50,
					backDelay : 2000
				});
			}
		</script>
	
	</main>