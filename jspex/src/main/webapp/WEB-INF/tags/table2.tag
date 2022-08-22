<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>
<%@ taglib prefix="jy" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- attribute는 JSP에서 값을 가져올때 사용하는 문법입니다. name으로 태그에 있는 값을 가져옴
type 값을 가져올 때 자료형을 말합니다.
required : true(자료형을 무조건 사용) false(자료형과 관계없이 사용) -->
<!-- variable : 변수형을 추가 할때 사용, 출력 여부 및 변수 이름을 추가 할때 사용합니다.(return에 사용할 이름)
variable-class : 자료형을 구분하게 됨. 단, required false일 경우 사용하지 않으셔도 됩니다.
scope : 출력 형태 AT_END는 태그 종료 후 출력
AT_BEGIN : TAG시작에 초기값을 입력 받아서 출력
NESTED는 foreach 사용시 적용하게 됩니다.-->

<%@ attribute name ="no" required="true" type="java.lang.Integer"%>
<%@ attribute name ="no2"%>
<%@ variable name-given="returncall"  variable-class = "java.lang.Integer" scope="AT_END"%>
<%@ variable name-given="returncall2" scope="AT_END"%>
<jy:set var = "returncall" value="${no}"></jy:set>
<jy:set var = "returncall2" value="${no2}"></jy:set>
