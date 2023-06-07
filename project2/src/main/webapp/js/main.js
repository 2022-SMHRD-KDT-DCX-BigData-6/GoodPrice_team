 // 전역 변수로 차트 객체 선언
   var myChart = null;
   var pieChart = null;
   var histogramChart = null;
   
   var storeData;
   
   var mapContainer = document.getElementById('map');
   var mapOption = {
       center: new kakao.maps.LatLng(35.1520445, 126.888729),
       level: 4
   };
   
   var map = new kakao.maps.Map(mapContainer, mapOption);
   
   var marker = [];
   
   // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
   function closeOverlay() {
       overlay.setMap(null);     
   }
   
   document.addEventListener("DOMContentLoaded", function(){
	   
	   const country = document.getElementById('country');
	   
	   console.log(country)
       
       country.addEventListener('change', CityChange)
      
		
   });
   
   var CityChange = function(){
	   console.log('changed')
		var a = $("#city option:selected").val();
		var b = this.value;
		console.log("시/도 : " + a + " 구/군 : " + b);
		// 키워드로 장소를 검색합니다
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(); 
		ps.keywordSearch(a + ' ' + b+'청', placesSearchCB); 

	}
    var shop_Idx;
	var shop_cnt;
	var wish_cnt;
	
	function placesSearchCB (data, status, pagination) {
		if (status === kakao.maps.services.Status.OK) {

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        var bounds = new kakao.maps.LatLngBounds();

            bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds);
            map.setLevel(4);
	    } 
		
		/* 현재 좌표에서 마커 찍는 코드 */
		$( document ).ready(function() { //페이지가 로딩되면 바로 실행한다.
			$.ajax({
		        type:"POST",             //POST방식통신
		        url:"http://localhost:8081/MessageSystem/SelectLatLng",     // Servlet과 mapping할 URL
		        dataType : "json",       //dataType은  JSON형식으로 지정한다.
		        data : {lat: data[0].y, lng : data[0].x},
		        success: function(store_data){
		            console.log(store_data);   //통신에 성공하면 콘솔에 출력한다. 
		            var marker = [];
		               
	                for (var i = 0; i < store_data.length; i++) {
	                   var lat = store_data[i].lat;
	                   var lng = store_data[i].lng;
	               
	                   marker[i] = new kakao.maps.Marker({
	                       map: map,
	                       position: new kakao.maps.LatLng(lat, lng)
	                   });
	                   
	                   
	                   var overlay = new kakao.maps.CustomOverlay({
	                       map: map,
	                       position: marker[i].getPosition()       
	                   });
	                   
	                   // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
	                   kakao.maps.event.addListener(marker[i], 'click', (function(marker, overlay, store) {
	                       return function() {
	                    	shop_Idx = store.shop_idx;   
	                    	
	                    	// 차트 숨기기
	                    	$('#myChart').hide();
	                    	$('#pieChartCanvas').hide();
	                    	$('#histogramChartCanvas').hide();
	                    	
	                    	// 기존 차트 제거
	                        if (myChart) {
	                            myChart.destroy();
	                            myChart = null;
	                        }
	                        if (pieChart) {
	                            pieChart.destroy();
	                            pieChart = null;
	                        }
	                        if (histogramChart) {
	                        	histogramChart.destroy();
	                        	histogramChart = null;
	                        }
	                    	
	                    	// 가게 리뷰건수 AJAX 통신
	       			        $.ajax({
	       					        type:"POST",             //POST방식통신
	       					        url:"http://localhost:8081/MessageSystem/Count_Review",     // Servlet과 mapping할 URL
	       					        dataType : "json",       //dataType은  JSON형식으로 지정한다.
	       					        data : {
	       					        	shopIdx: shop_Idx
	       					        },
	       					        success: function(data){
	       					            console.log(data);
										shop_cnt = data.cnt;
										document.getElementById("shop_review").innerText = shop_cnt+"건";
	       					        },
	       					        error: function(xhr, status, error) {
	       					        	console.log(error);
	       					        }  
	       					    });
	                    	
	       			  		// 가게 찜수 AJAX 통신
	       			        $.ajax({
	       					        type:"POST",             //POST방식통신
	       					        url:"http://localhost:8081/MessageSystem/CountWish",     // Servlet과 mapping할 URL
	       					        dataType : "json",       //dataType은  JSON형식으로 지정한다.
	       					        data : {
	       					        	shopIdx: shop_Idx
	       					        },
	       					        success: function(data){
	       					            console.log(data);
										wish_cnt = data.cnt;
										document.getElementById("shop_like").innerText = wish_cnt;
	       					        },
	       					        error: function(xhr, status, error) {
	       					        	console.log(error);
	       					        }  
	       					    });
	                    	
	                    	
	                    	   // 가게정보 테이블 출력
	                    	   
	                    	   $("#store_table").show();
	                    	   
							   document.getElementById("shop_img").src = store.shop_img;
							   document.getElementById("shop_img").src = store.shop_img;
							   document.getElementById("shop_name").innerText = store.shop_name;
							   document.getElementById("shop_addr").innerText = store.shop_addr;
							   document.getElementById("shop_tel").innerText = store.shop_tel;
							   document.getElementById("shop_business").innerText = store.shop_business;
							   document.getElementById("shop_items").innerText = store.shop_items;
							   document.getElementById("shop_parking").innerText = store.shop_parking;
							   
							   // 첫 번째 테이블의 shop_name 값을 가져와서 변수에 저장
							   const shopName = document.getElementById('shop_name').textContent;
							   
							   // 두 번째 테이블의 review_store 요소를 선택하여 내용 변경
							   const reviewStoreElement = document.getElementById('review_store');
							   reviewStoreElement.textContent = shopName;

							   overlay.setMap(map);
	                       };
	                   })(marker[i], overlay, store_data[i]));
	                   
	                   function closeOverlay() {
	                	    overlay.setMap(null);     
	               		}
	               }
	            
		            
		        },
		        error: function(xhr, status, error) {
		        	console.log(error);
		        }  
		    });
		});
	}
	
	 // 가게 리뷰 출력
    document.getElementById("shop_review").addEventListener("click", function() {
        // 팝업 창을 생성하고 스타일을 적용
        var modalOverlay = document.createElement("div");
        modalOverlay.classList.add("modal-overlay");
        
        var modalContent = document.createElement("div");
        modalContent.classList.add("modal-content");
        
        var modalClose = document.createElement("span");
        modalClose.classList.add("modal-close");
        modalClose.textContent = "✖";
        
        var modalTitle = document.createElement("h2");
        modalTitle.textContent = "리뷰 내역";
        
        var modalTable = document.createElement("table");
        modalTable.classList.add("review-table");
        
     	// 첫 번째 행에 컬럼명 추가
        var columnNames = ["번호", "닉네임", "내용", "평점", "날짜"];
        var headerRow = document.createElement("tr");
        for (var j = 0; j < columnNames.length; j++) {
            var headerCell = document.createElement("th");
            headerCell.textContent = columnNames[j];
            headerRow.appendChild(headerCell);
        }
        modalTable.appendChild(headerRow);
        
        // 모달 창에 리뷰 내역을 동적으로 로드하여 표시하는 코드를 작성
        // 예시로 임의의 데이터로 테이블을 구성합니다.
        // AJAX 비동기 통신으로 리뷰 데이터 가져오기
	    $.ajax({
	        type: "POST",
	        url: "http://localhost:8081/MessageSystem/SelectReview",
	        dataType: "json",
	        data : {
	        	shopIdx: shop_Idx,
	        },
	        success: function(reviewData) {
	        	console.log(reviewData);
	            for (var i = 0; i < reviewData.length; i++) {
	                var row = document.createElement("tr");
	                
	                var cellId = document.createElement("td");
	                cellId.textContent = i+1;
	                
	                var cellUser = document.createElement("td");
	                cellUser.textContent = reviewData[i].m_nick;
	                
	                var cellContent = document.createElement("td");
	                cellContent.textContent = reviewData[i].review_content;

	                var cellScore = document.createElement("td");
	                cellScore.textContent = reviewData[i].review_score;
	                
	                var cellDate = document.createElement("td");
	                cellDate.textContent = reviewData[i].review_dt;
	                
	                row.appendChild(cellId);
	                row.appendChild(cellUser);
	                row.appendChild(cellContent);
	                row.appendChild(cellScore);
	                row.appendChild(cellDate);
	                
	                modalTable.appendChild(row);
	            }
	        },
	        error: function(xhr, status, error) {
	            console.log(error);
	        }
	    });
        
        modalContent.appendChild(modalClose);
        modalContent.appendChild(modalTitle);
        modalContent.appendChild(modalTable);
        
        modalOverlay.appendChild(modalContent);
        document.body.appendChild(modalOverlay);
        
        // 팝업 창 닫기 이벤트 핸들러
        modalClose.addEventListener("click", function() {
            document.body.removeChild(modalOverlay);
        });
        
        // 팝업 창 외부를 클릭해도 창이 닫히지 않도록 이벤트 전파 차단
        modalOverlay.addEventListener("click", function(event) {
            if (event.target === modalOverlay) {
                event.stopPropagation();
            }
        });
        
        // 팝업 창 표시
        modalOverlay.style.display = "block";
    });
	
	// 리뷰 데이터 전송
    function saveReview() {
        // 데이터 추출
        var serviceRating = document.querySelector('input[name="service"]:checked').value;
        var effectiveRating = document.querySelector('input[name="effective"]:checked').value;
        var cleanRating = document.querySelector('input[name="clean"]:checked').value;
        var content = document.querySelector('textarea[name="content"]').value;
        var filename = document.querySelector('#file').value;

        if (!filename) {
        	// 경고창 표시
        	$("#alertReceipt").click(); 
            return; // 등록 중단
        }

        
        // AJAX 통신
        $.ajax({
		        type:"POST",             //POST방식통신
		        url:"http://localhost:8081/MessageSystem/InsertReview",     // Servlet과 mapping할 URL	
		        dataType : "text",
		        data : {
		        	userId: userId,
		        	shopIdx: shop_Idx,
		            serviceRating: serviceRating,
		            effectiveRating: effectiveRating,
		            cleanRating: cleanRating,
		            content: content,
		            filename: filename
		        },
		        success: function(){
		        	
		         // 리뷰등록 성공시 회원 포인트정보 업데이트 AJAX 통신
		        	$.ajax({
		        	    type: "POST",
		        	    url: "http://localhost:8081/MessageSystem/UpdatePoint",
		        	    dataType: "text",
		        	    data: {
		        	        user_Id: userId // 업데이트할 회원의 userId
		        	    },
		        	    success: function(response) {
		        	        console.log("회원 정보 업데이트 성공");
		        	        // 추가적인 처리 로직 작성
		        	    },
		        	    error: function(xhr, status, error) {
		        	        console.log("회원 정보 업데이트 실패");
		        	        console.log(error);
		        	        // 에러 처리 로직 작성
		        	    }
		        	}); 
		        	
		        	// 리뷰등록 성공시 알림창
		        	$("#ReviewSuccess").click();
		        	
		            // 등록 성공시 창을 닫는 함수
		        	$(".modal_wrap").hide();
		            $(".black_bg").hide();
		         	
		            // 폼 필드 초기화 함수 호출
		            resetForm();
		          	
		         	// 리뷰 건수 업데이트
		            var currentReviewCount = parseInt($("#shop_review").text().replace("건", ""));
		            $("#shop_review").text((currentReviewCount + 1) + "건");
		            
		        },
		        error: function(xhr, status, error) {
		        	console.log(error);
		        }  
		    });
        
     	// 리뷰등록성공시 알림창 실행 버튼 클릭 이벤트
        $(document).ready(function() {
            $("#ReviewSuccess").click(function() {
                Swal.fire({
                    icon: 'success',
                    title: '리뷰 등록 완료!',
                    text: '500P 적립되었습니다.',
                });
            });
        });
    }
    
 	// 영수증 미첨부시 경고창 실행 버튼 클릭 이벤트
    $(document).ready(function() {
        $("#alertReceipt").click(function() {
            Swal.fire({
                icon: 'warning',
                title: '영수증 파일을 첨부해주세요!',
            });
        });
    });
  
 	// 폼 필드 초기화 함수
    function resetForm() {
        // 폼 필드 초기화
        $("input[name='service']").prop("checked", false);
        $("input[name='effective']").prop("checked", false);
        $("input[name='clean']").prop("checked", false);
        $("textarea[name='content']").val("");
        $(".upload-name").val("");
        $("#file").val("");
    }
    
    /* 파일 첨부시 파일이름 변경 */
    $("#file").on('change',function(){
    	  var fileName = $("#file").val();
    	  $(".upload-name").val(fileName);
    	});
    
    // 찜 데이터 전송 
    function saveWish(){
    	
    	 // userId 값 확인
        if (!userId) {
        	// 경고 알림창
        	$("#alertWish").click();
            return; // 등록 중단
        }
    	
    	// AJAX 통신
        $.ajax({
		        type:"POST",             //POST방식통신
		        url:"http://localhost:8081/MessageSystem/InsertWish",     // Servlet과 mapping할 URL
		        dataType : "text",       //dataType은  JSON형식으로 지정한다.
		        data : {
		        	userId: userId,
		        	shopIdx: shop_Idx
		        },
		        success: function(data){
		        	console.log(data);
		        	
		        	// 찜 성공 알림창
		        	$("#WishSuccess").click();
		        	
		        	// 찜수 업데이트
		            var currentWishCount = parseInt($("#shop_like").text());
		            $("#shop_like").text((currentWishCount + 1));
		        },
		        error: function(xhr, status, error) {
		        	console.log(error);
		        }  
		    });
    	
     	// 찜성공 알림창 실행 버튼 클릭 이벤트
        $(document).ready(function() {
            $("#WishSuccess").click(function() {
                Swal.fire({
                    icon: 'success',
                    title: '찜 목록에 추가되었습니다.',
                });
            });
        });
     	
    }
    
     	// 비로그인 경고창 실행 버튼 클릭 이벤트
    	$(document).ready(function() {
    	    $("#alertWish").click(function() {
    	        Swal.fire({
    	            icon: 'error',
    	            title: '로그인이 필요한 서비스입니다.',
    	            text: '',
    	        });
    	    });
    	});
    
    /* 평점 차트 그리기 */
   function makeChart() {
	// 막대 차트를 표시	
	$('#myChart').show();
	// 파이 차트를 표시
	$('#pieChartCanvas').show();
	// 히스토그램 표시
	$('#histogramChartCanvas').show();
	
    var chartShopName = document.getElementById('shop_name').innerText;
	
 	// 기존 차트 제거
    if (myChart) {
        myChart.destroy();
        myChart = null;
    }
    if (pieChart) {
        pieChart.destroy();
        pieChart = null;
    }
    if (histogramChart) {
    	histogramChart.destroy();
    	histogramChart = null;
    }
    
    // AJAX 요청
    $.ajax({
        type: "POST",
        url: "http://localhost:8081/MessageSystem/SelectReviewData",
        data: { shopIdx: shop_Idx }, // 요청에 필요한 데이터 전달
        dataType: "json",
        success: function (response) {
            var context = document.getElementById('myChart').getContext('2d');
            myChart = new Chart(context, {
                type: 'bar',
                data: {
                    labels: ['서비스 or 맛', '가성비', '청결도'],
                    datasets: [{
                        label: '평가점수',
                        fill: false,
                        data: [response.Service, response.Price, response.Clean],
                        backgroundColor: [
                            'rgba(54, 162, 235, 0.8)',
                            'rgba(54, 162, 235, 0.8)',
                            'rgba(54, 162, 235, 0.8)',
                        ],
                        borderColor: [
                            'rgba(54, 162, 235, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(54, 162, 235, 1)',
                        ],
                        borderWidth: 3
                    }]
                },
                options: {
                    title: {
                        display: true,
                        text: '이용자 평점',
                        fontSize: 20
                    },
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: true,
                                min: 0, // 최소값 설정
                                max: 5, // 최대값 설정
                                fontSize: 12
                            }
                        }],
                        xAxes: [{
                            ticks: {
                                fontSize: 12
                            },
                            barThickness: 70
                        }]
                    }
                }
            });
        },
        error: function (xhr, status, error) {
            console.log(error); // 에러 처리
        }
    });
 	
	  // 파이 차트 그리기
      // AJAX 요청
      $.ajax({
        type: "POST",
        url: "http://localhost:8081/MessageSystem/SelectGenderData",
        data: { shopIdx: shop_Idx }, // 요청에 필요한 데이터 전달
        dataType: "json",
        success: function (response) {
          var genderData = response; 
          var total = genderData.man + genderData.woman;
          var pieChartData = {
            labels: ['남성', '여성'],
            datasets: [{
              data: [genderData.man / total * 100, genderData.woman / total * 100],
              backgroundColor: ['rgb(54, 162, 235)', 'rgb(255, 99, 132)']
            }]
          };

          var pieContext = document.getElementById('pieChartCanvas').getContext('2d');
          pieChart = new Chart(pieContext, {
            type: 'pie',
            data: pieChartData,
            options: {
              responsive: false,
              title: {
                  display: true,
                  text: '이용자 성비', // 제목 설정
                  fontSize: 20
                },
                plugins: {
            	  tooltip: {
            	    enabled: true, // 툴팁 기능 활성화
            	    mode: 'nearest', // 항상 가장 가까운 툴팁 표시
            	    callbacks: {
            	      label: function (context) {
            	        var value = context.dataset.data[context.dataIndex];
            	        return value.toFixed(1) + '%';
            	      }
            	    }
            	  }
            	}
              }
          });
        },
        error: function (xhr, status, error) {
          console.log(error); // 에러 처리
        }
      });
	  
 	  // 히스토그램 차트 그리기
      // AJAX 요청
      $.ajax({
        type: "POST",
        url: "http://localhost:8081/MessageSystem/SelectAgeData",
        data: { shopIdx: shop_Idx }, // 요청에 필요한 데이터 전달
        dataType: "json",
        success: function (response) {
        	console.log(response);
        	var histogramData = {
			        labels: ['10대', '20대', '30대', '40대', '50대', '60대'],
			        datasets: [{
			          label: '백분율',
			          data: [
			        	  response.one,
			              response.two,
			              response.three,
			              response.four,
			              response.five,
			              response.six
			          ],
			          backgroundColor: 'rgba(75, 192, 192, 0.8)',
			          borderColor: 'rgba(75, 192, 192, 1)',
			          borderWidth: 3
			        }]
			      };
        	
        		  var total = response.one + response.two + response.three + response.four + response.five + response.six;
            	  for (var i = 0; i < histogramData.datasets[0].data.length; i++) {
              	   histogramData.datasets[0].data[i] = (histogramData.datasets[0].data[i] / total) * 100; // 백분율로 변환
            	  }

			      var histogramContext = document.getElementById('histogramChartCanvas').getContext('2d');
			      histogramChart = new Chart(histogramContext, {
			        type: 'bar',
			        data: histogramData,
			        options: {
			          responsive: false,
			          title: {
		                  display: true,
		                  text: '연령별 비율', // 제목 설정
		                  fontSize: 20
		                },
	                plugins: {
	                	  datalabels: {
	                	    display: true,
	                	    anchor: 'end',
	                	    align: 'top',
	                	    color: 'black',
	                	    font: {
	                	      weight: 'bold'
	                	    },
	                	    formatter: function(value) {
	                	      return value.toFixed(1) + '%';
	                	    }
	                	  }
	                	},
			          scales: {
		        	  yAxes: [{
		        		    ticks: {
		        		      beginAtZero: true,
		        		      min: 0,
		        		      fontSize: 12,
		        		      callback: function(value) {
		        		        return value.toFixed(1) + '%';
		        		      }
		        		    },
		        		    scaleLabel: {
		        		      display: true,
		        		      labelString: '백분율 (%)'
		        		    }
		        		  }],
			            xAxes: [{
			              ticks: {
			                fontSize: 12
			              },
			              barThickness: 40
			            }]
			          }
			        }
			      });			          
        	
        },
        error: function (xhr, status, error) {
          console.log(error); // 에러 처리
        }
      });
   
  }
			    
	// 리뷰 작성 창 띄우기
        window.onload = function() {
    	   
   	    function onClick() {
   	    	 // userId 값 확인
      if (!userId) {
      	// 경고창
      	$("#alertLogin").click();
          return; // 등록 중단
      }
   	        document.querySelector('.modal_wrap').style.display ='block';
   	        document.querySelector('.black_bg').style.display ='block';
   	    }   
   	    function offClick() {
   	        document.querySelector('.modal_wrap').style.display ='none';
   	        document.querySelector('.black_bg').style.display ='none';
   	    }
   	 
   	    document.getElementById('modal_btn').addEventListener('click', onClick);
   	    document.querySelector('.modal_close').addEventListener('click', offClick);
   	 
   	};
   	
   	// 비로그인 에러 알림창 실행 버튼 클릭 이벤트
   	$(document).ready(function() {
   	    $("#alertLogin").click(function() {
   	        Swal.fire({
   	            icon: 'error',
   	            title: '로그인이 필요한 서비스입니다.',
   	            text: '',
   	        });
   	    });
   	});
   	
   	// 셀렉트박스 생성
          var cnt = new Array();
          cnt[0] = new Array('전체');
          cnt[1] = new Array('전체','강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');
          cnt[2] = new Array('전체','강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');
          cnt[3] = new Array('전체','남구','달서구','동구','북구','서구','수성구','중구','달성군');
          cnt[4] = new Array('전체','계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군');
          cnt[5] = new Array('전체','광산구','남구','동구','북구','서구');
          cnt[6] = new Array('전체','대덕구','동구','서구','유성구','중구');
          cnt[7] = new Array('전체','남구','동구','북구','중구','울주군');
          cnt[8] = new Array('전체','고양시','과천시','광명시','구리시','군포시','남양주시','동두천시','부천시','성남시','수원시','시흥시','안산시','안양시','오산시','의왕시','의정부시','평택시','하남시','가평군','광주시','김포시','안성시','양주군','양평군','여주군','연천군','용인시','이천군','파주시','포천시','화성시');
          cnt[9] = new Array('전체','강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','황성군');
          cnt[10] = new Array('전체','제천시','청주시','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');
          cnt[11] = new Array('전체','공주시','보령시','서산시','아산시','천안시','금산군','논산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');
          cnt[12] = new Array('전체','군산시','김제시','남원시','익산시','전주시','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');
          cnt[13] = new Array('전체','광양시','나주시','목포시','순천시','여수시','여천시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','여천군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');
          cnt[14] = new Array('전체','경산시','경주시','구미시','김천시','문겅시','상주시','안동시','영주시','영천시','포항시','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');
          cnt[15] = new Array('전체','거제시','김해시','마산시','밀양시','사천시','울산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','양산시','의령군','창녕군','하동군','함안군','함양군','합천군');
          cnt[16] = new Array('전체','서귀포시','제주시','남제주군','북제주군');
          
          
          function change(add) {
  sel=document.form.county
    /* 옵션메뉴삭제 */
    for (i=sel.length-1; i>=0; i--){
      sel.options[i] = null
      }
    /* 옵션박스추가 */
    for (i=0; i < cnt[add].length;i++){                     
                      sel.options[i] = new Option(cnt[add][i], cnt[add][i]);
      }         
  }
