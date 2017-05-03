<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<link href="<c:url value="/static/css/css3.css" />" rel="stylesheet" type="text/css">
<script src="//cdnjs.cloudflare.com/ajax/libs/react/0.10.0/react-with-addons.min.js" type = "text/javascript"></script>


<script src="<c:url value="/static/js/error2.js" />"  type ="text/javascript"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

</head>
<body>
	 
	   <div>
	   </div>
  <!-- change paths later -->
  
  	<script src="./js/side-menu.js"></script>
    <script src="./js/index.js"></script>
    <!-- <div style="background-image:url(http://b.vimeocdn.com/ts/192/106/19210697_1280.jpg);width:1340px;height:450px;color:black;font-size:18px;"></div> -->
    <script src="./js/jquery.js"></script>
    <script src="./js/bootstrap.js"></script>
    
    <script type="text/javascript">
    
    /** @jsx React.DOM */
 // no JSX without changing the script tag type :(

 /*! react-infinite-scroll - v 0.1.3 - guillaumervls 2014-04-07 */
 !function a(b,c,d){function e(g,h){if(!c[g]){if(!b[g]){var i="function"==typeof require&&require;
 if(!h&&i)return i(g,!0);if(f)return f(g,!0);throw new Error("Cannot find module '"+g+"'")}var j=c[g]={exports:{}};
 b[g][0].call(j.exports,function(a){var c=b[g][1][a];return e(c?c:a)},j,j.exports,a,b,c,d)}return c[g].exports}
 for(var f="function"==typeof require&&require,g=0;g<d.length;g++)e(d[g]);return e}
 ({1:[function(a,b){function c(a){return a?a.offsetTop+c(a.offsetParent):0}b.exports=function(a)
	 {if(a.addons&&a.addons.InfiniteScroll)return a.addons.InfiniteScroll;a.addons=a.addons||{};
	 var b=a.addons.InfiniteScroll=a.createClass({
		 getDefaultProps:function(){return{pageStart:0,hasMore:!1,loadMore:function(){},
			 threshold:250,loader:b._defaultLoader}},componentDidMount:function()
			 {this.pageLoaded=this.props.pageStart,this.attachScrollListener()},componentDidUpdate:function()
			 {this.attachScrollListener()},render:function(){var b=this.props;return a.DOM.div
			 (null,b.children,b.hasMore&&b.loader)},scrollListener:function()
			 {var a=this.getDOMNode(),b=void 0!==window.pageYOffset?window.pageYOffset:
				 (document.documentElement||document.body.parentNode||document.body).
				 scrollTop;c(a)+a.offsetHeight-b-window.innerHeight<Number(this.props.threshold)
				 &&(this.detachScrollListener(),this.props.loadMore(this.pageLoaded+=1))},
				 attachScrollListener:function(){this.props.hasMore&&
					 (window.addEventListener("scroll",this.scrollListener)
							 ,window.addEventListener("resize",this.scrollListener),this.scrollListener())},
							 detachScrollListener:function(){window.removeEventListener("scroll",this.scrollListener),window.removeEventListener("resize",this.scrollListener)},componentWillUnmount:function(){this.detachScrollListener()}});return b.setDefaultLoader=function(a){b._defaultLoader=a},b}},{}],2:[function(a){var b=a("./react-infinite-scroll");"function"==typeof define&&define.amd?define(["react"],function(a){return b(a)}):(window.React.addons=window.React.addons||{},window.React.addons.InfiniteScroll=b(window.React))},{"./react-infinite-scroll":1}]},{},[2]);
		 }
	 }

 function createDiv(page) {
   return React.DOM.div({
     className: 'item',
     style: {
       backgroundColor: '#'+(Math.random()*0xFFFFFF<<0).toString(16)
     }
   }, page + 1)
 }

 var Wrapper = React.createClass({
   
   getInitialState: function() {
     return {
       hasMore: true,
       items: [createDiv(0)]
     };
   },
   loadMore: function(page) {
     console.log('load');
     setTimeout(function() {
       this.setState({
         items: this.state.items.concat([createDiv(page)]),
         hasMore: (page < 10)
       });
     }.bind(this), 100);
   },
   render: function() {
     console.log('render');
     var InfiniteScroll = React.addons.InfiniteScroll;
     return React.DOM.div({
       className: "scroll-holder"
     },
     InfiniteScroll({
       pageStart: 0,
       loadMore: this.loadMore,
       hasMore: this.state.hasMore,
       loader: React.DOM.div({
         className: "loader"
       }, " - ")
     },
     this.state.items))
   }
 });

 React.renderComponent(Wrapper(), document.body);
     

</script>

	
</body>
</html>