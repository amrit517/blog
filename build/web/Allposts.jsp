<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.Connectionprovider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>

<div class='row'>
<%
    Thread.sleep(1000);
    PostDao d=  new PostDao(Connectionprovider.getConnection());
    int cid = Integer.parseInt(request.getParameter("cid"));
    List<Post> posts = null;
    if(cid==0){
        posts =  d.Allposts();
        
    }
    else{
        posts = d.Postbycid(cid);
    }
    
    for(Post p: posts){
        %>
        <div class='col-md-6 mt-2'>
            <div class='card'>
                <img class="card-img-top" src="blogpics/<%=p.getPic()%>" alt="Card image" style="width:350px;height:200px">
                <div class='card-body'>
                    <b><%=p.getTitle()%></b>
                    <p><%=p.getContent()%></p>
                    <pre><%=p.getCode()%></pre>             
                </div>               
            </div>
        </div>
        
                <%
        
        
    }
    %>
    
</div>