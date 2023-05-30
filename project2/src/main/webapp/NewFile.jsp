<script>
    var cnt = new Array();
    // 구/군 정보 생략

    function change(add) {
        // 구/군 옵션 메뉴 추가 코드 생략
        // ...

        // 시/도와 구/군 선택값 가져오기
        var city = document.form.city.value;
        var county = document.form.county.value;

        // 중심 좌표값 설정
        var centerLatLng = getCenterLatLng(city, county);
        if (centerLatLng) {
            // 지도 중심 좌표 변경
            var mapOption = {
                center: new kakao.maps.LatLng(centerLatLng[0], centerLatLng[1]),
                level: 5
            };
            var map = new kakao.maps.Map(document.getElementById('map'), mapOption);
            // 지도 생성 및 초기화 코드
            // ...
        }
    }

    // 시/도와 구/군에 따른 중심 좌표값 반환하는 함수
    function getCenterLatLng(city, county) {
        // 시/도와 구/군에 따라 중심 좌표값을 설정해주세요.
        // 아래는 몇 가지 예시입니다.
        if (city === '서울' && county === '강남구') {
            return [37.497942, 127.027621];
        } else if (city === '부산' && county === '해운대구') {
            return [35.160041, 129.157006];
        } else if (city === '대구' && county === '중구') {
            return [35.867221, 128.597953];
        } else {
            // 기본값이나 해당 시/도, 구/군에 대한 중심 좌표값이 없는 경우 설정
            return [35.1520445, 126.888729];
        }
    }
</script>
<form name="form" method="post" action="$PHP_SELF">
    <!-- 시/도와 구/군 선택 코드 생략 -->
</form>
<div id="map" style="width: 100%; height: 400px;"></div>
