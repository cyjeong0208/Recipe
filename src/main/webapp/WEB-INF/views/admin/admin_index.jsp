<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>관리자페이지</title>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">    
   
<!-- 메뉴를 위한 도넛차트 = -->
<style>
	/*Font*/
	body{
		font-family: 'Jua', sans-serif;		
	}
	
	/* 관리자페이지글씨  */
	.admin {
	    fill: white;
	    font-weight:bold;
	    font-size:50px;
	}
	
	/* 페이지글씨  */
	.page{
		fill:white;
		font-weight:bold;
	    font-size:30px;
	}
</style>
<!-- 통계에 필요한 선 차트 -->
<style>
	.grid line {
	    stroke: lightgrey;
	    stroke-opacity: 0.7;
	}
	.lineChart {
	    fill: none;
	    stroke: steelblue;
	    stroke-width: 1.5px;
	}
	.lineChart:hover {
	    stroke: black;
	    stroke-width: 3px;
	}
	.toolTip {
	    position: absolute;
	    border: 1px solid;
	    border-radius: 4px 4px 4px 4px;
	    background: rgba(0, 0, 0, 0.8);
	    color : white;
	    padding: 5px;
	    text-align: center;
	    font-size: 12px;
	    min-width: 30px;
	}
</style>
</head>
<body  bgcolor="black">

<!-- 메뉴를 위한 도넛차트  -->
<div class="graph" id="piegraph" style="height:2000" ></div>

<!-- 통계에 필요한 선 차트 -->

<svg style="width:700; height:320"></svg>

<script src="https://d3js.org/d3.v4.min.js"></script>
<!-- 메뉴를 위한 도넛차트 -->
<script>
	/* 위치  */
	var w =1850, h = 900;
	var graphData = [16, 16, 16, 16, 16, 16];
	var colorData = ["red", "orange", "green", "#5ED1D4", "blue", "purple"];
	var textData = ["회원관리", "레시피관리", "영상관리", "레시피그램관리", "채팅방관리", "메시지관리"];
	//이동할 페이지 
	var pathData = ["/admin_users", "/admin_recipe", "/admin_foodvideo", "/recipegram_index", "/admin_chat", "/admin_message"];
	var pie = d3.pie();
	var arc = d3.arc().innerRadius(200).outerRadius(300); 
	 
	var svg = d3.select(".graph")
	    .append("svg")
	    .attr("width", w)
	    .attr("height", h)
	    .attr("id", "graphWrap");
	 
	var g = svg.selectAll(".pie")
	    .data(pie(graphData))
	    .enter()
	    .append("g")
	    .attr("class", "pie")
	    .attr("transform","translate("+w/2+","+h/2+")");
	 
	g.append("path")
	    .style("fill", function(d, i) {
	        return colorData[i];
	    }) 
	    .transition()
	    .duration(500)
	    .delay(function(d, i) { 
	        return i * 500;
	    })
	    .attrTween("d", function(d, i) { 
	        var interpolate = d3.interpolate(
	            {startAngle : d.startAngle, endAngle : d.startAngle}, 
	            {startAngle : d.startAngle, endAngle : d.endAngle} 
	        );
	        return function(t){
	            return arc(interpolate(t)); 
	        }
	    });
	 
	g.append("text")
	    .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
	    .attr("dy", ".35em")
	    .attr("class", "page")
	    .style("text-anchor", "middle")
	    .on("click", function(d, i){
			location.href = pathData[i];
		})
	    .text(function(d, i) {
	        return textData[i];
	    });

	 /* class이름 / 위치 / 클릭 시 이벤트 발생*/
	svg.append("text")
	    .attr("class", "admin")
	    .on("click", function() {
	    	location.href = "/admin_index";
	    })
	    .attr("transform", "translate("+(w/2-135)+", "+(h/2+15)+")")
	    .text("관리자페이지");
	 
	 
</script>
<!-- 
<script>
 
    var series = ["총 회원 수", "가입자 수"];
 	
    /* x축 : 일 / y축 : 명수 or 개수 
       {'x축 : y축, '}*/
    var dataset = [ 
        {'1':17, '2':27, '3':37, '4':27, '5':17, '6':7,  '7':9, '8':19, '9':29, '10':19, '11':9, '12':0},
        {'1': 9, '2':19, '3':29, '4':39, '5':29, '6':19, '7':9, '8':7, '9':17, '10':27, '11':17, '12':7}];
 
    var keys = d3.keys(dataset[0]);
    var data = [];
 
    dataset.forEach(function(d, i) {
           data[i] = keys.map(function(key) { return {x: key, y: d[key]}; })
    });
 
    var margin = {left: 20, top: 2000, right: 10, bottom: 20};
    var svg = d3.select("svg");
    var width  = parseInt(svg.style("width"), 10) - margin.left - margin.right;
    var height = parseInt(svg.style("height"), 10)- margin.top  - margin.bottom;
 
    var svgG = svg.append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
 
    var xScale = d3.scalePoint()//scaleBand() scaleOrdinal
        .domain(keys)
        .rangeRound([0, width]);
 
    var yScale = d3.scaleLinear()
        .domain([0, d3.max(dataset, function(d) { return d3.max(keys, function(key) { return d[key];});})])
        .nice()
        .range([height, 0]);
    var colors = d3.scaleOrdinal(d3.schemeCategory20);
    /* 색깔지정 */
    var colors = d3.scaleOrdinal().range(["IndianRed", "RoyalBlue"]);  
    
    svgG.append("g")
        .attr("class", "grid")
        .attr("transform", "translate(0," + height + ")")
        .call(d3.axisBottom(xScale)
            .tickSize(-height)
        );
 
    svgG.append("g")
        .attr("class", "grid")
        .call(d3.axisLeft(yScale)
            .ticks(5)
            .tickSize(-width)
        );
 
    var line = d3.line()
           .curve(d3.curveBasis)
        .x(function(d) { return xScale(d.x); })
        .y(function(d) { return yScale(d.y); });
 
    var lineG = svgG.append("g")
        .selectAll("g.second")
           .data(data)
        .enter().append("g");
 
    lineG.append("path")
        .attr("class", "lineChart")
        .style("stroke", function(d, i) { return colors( series[i]); })
        .attr("d", line);
 
    lineG.selectAll("dot")
	    .data(function(d) {return d })
	    .enter().append("circle")
	        .attr("r", 3)
	        .attr("cx", function(d) { return xScale(d.x) })
	        .attr("cy", function(d) { return yScale(d.y);})
	        .on("mouseover", function() { tooltip.style("display", null); })
	        .on("mouseout",  function() { tooltip.style("display", "none"); })
	        .on("mousemove", function(d) {
	            tooltip.style("left", (d3.event.pageX+10)+"px");
	            tooltip.style("top",  (d3.event.pageY-10)+"px");
	            tooltip.html("month. " + d.x + "<br/>" + "data value : " + d.y);
	        });
	
	var tooltip = d3.select("body")
	    .append("div")
	    .attr("class", "toolTip")
	    .style("display", "none");
    
    var legend = svgG.append("g")
        .attr("text-anchor", "end")
        .selectAll("g")
        .data(series)
        .enter().append("g")
        .attr("transform", function(d, i) { return "translate(0," + i * 20 + ")"; });
 
    legend.append("rect")
        .attr("x", width - 20)
        .attr("width", 19)
        .attr("height", 19)
                .attr("fill", colors);
 
    legend.append("text")
        .attr("x", width - 30)
        .attr("y", 9.5)
        .attr("dy", "0.32em")
        .text(function(d) { return d; });
 
</script> -->

</body>
</html>