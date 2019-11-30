package board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class UpdateService
 */
@WebServlet("/UpdateService")
public class UpdateService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//   String fileName = request.getParameter("file");
		//   String LnfTitle = request.getParameter("LnfTitle");
		//   String LnfContent = request.getParameter("LnfContent");



		//   System.out.println(fileName);
		//   System.out.println(LnfTitle);
		//   System.out.println(LnfContent);


		//      String author = request.getParameter("author");
		//      String title = request.getParameter("title");
		//      String fileName = request.getParameter("file");

		//      System.out.println(author);
		//      System.out.println(title);
		//      System.out.println(fileName);

		HttpSession session=request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		
		String fileName = request.getParameter("lnfFile");
//		String title=request.getParameter("lnfTitle");
//	 String content=request.getParameter("lnfContent");
//		
		String lnfId=(String)session.getAttribute("lnfId");
		int lnfID=Integer.parseInt(lnfId);
		System.out.println(fileName);


		ServletContext context = getServletContext(); // 어플리케이션에 대한 정보를 ServletContext 객체가 갖게 됨. (서버의 절대경로를 구하는 데 필요)
		String saveDir = context.getRealPath("upload"); // 절대경로를 가져옴
		System.out.println("절대경로 >> " + saveDir);

		int maxSize = 3 * 1024 * 1024; // 3MB
		String encoding = "UTF-8";



		// saveDir: 경로
		// maxSize: 크기제한 설정
		// encoding: 인코딩타입 설정
		// new DefaultFileRenamePolicy(): 동일한 이름일 경우 자동으로 (1),(2)..붙게 해줌


		boolean isMulti = ServletFileUpload.isMultipartContent(request);// boolean타입. ??????
		System.out.println(isMulti);

		if (isMulti) {
			System.out.println("if 문 진입");


			MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding,new DefaultFileRenamePolicy());
			//      FileDAO dao = new FileDAO();

			String title = multi.getParameter("lnfTitle");
			String content = multi.getParameter("lnfContent");
			String file = multi.getFilesystemName("lnfFile");

			if(title.equals("")||content.contentEquals("")) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				lnfDAO lnfDAO = new lnfDAO();

				int result = lnfDAO.update(lnfID, title, content, file);
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글수정에 실패했습니다')");
					script.println("history.back()");		
					script.println("</script>");

				} else {

					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='/iSpace/view/BOARD/lnf.jsp'");
					//script.println("history.back()");
					script.println("</script>");

				}		
			}
			
			System.out.println(title);
			System.out.println(content);
			System.out.println(file);


			

			/*
			 * 
			 * 
         try {
            System.out.println("tryyyyyyyyyyy");

      //      int result = dao.uploadFile(author, title, file);
            String moveUrl = "";
            if (result > 0) {
               System.out.println("저장완료");
               //moveUrl = "selectService";
            } else {
               System.out.println("저장실패");
            //   moveUrl = "Upload.html";
            }
            response.sendRedirect(moveUrl);



         } catch (Exception e) {
            e.printStackTrace();
         }


			 */
		} else {
			System.out.println("일반 전송 form 입니다.");
		}


	}

}
