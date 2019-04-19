/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.yourcompany.struts.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.yourcompany.struts.Exception.AppException;
import com.yourcompany.struts.bean.EmployeeInfotable;
import com.yourcompany.struts.bean.InvoiceInfotable;
import com.yourcompany.struts.dao.GoodsInfoDao;
import com.yourcompany.struts.dao.GoodsStockDao;
import com.yourcompany.struts.dao.InstoreInfoDao;
import com.yourcompany.struts.dao.OperaterecordDao;
import com.yourcompany.struts.dao.StockIninDao;

/** 
 * MyEclipse Struts
 * Creation date: 07-21-2010
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class StockIoAction extends DispatchAction {
	
	public ActionForward viewStockIo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		    StockIninDao userDao = new StockIninDao();
			ArrayList list =userDao.viewStockIo();
			request.setAttribute("list", list);
			System.out.println("======================cccccccccccccccc");
			return mapping.findForward("viewStockIo");
		}
	
	public ActionForward viewStockOut(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		    StockIninDao userDao = new StockIninDao();
			ArrayList list =userDao.viewStockOut();
			request.setAttribute("list", list);
			System.out.println("======================cccccccccccccccc");
			return mapping.findForward("viewStockOut");
		}
	public ActionForward addStockIo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		    StockIninDao userDao = new StockIninDao();
		    System.out.println("==================chen");
		    GoodsInfoDao goodsinfoDao=new GoodsInfoDao();
		    GoodsStockDao goodsstockDao=new GoodsStockDao();
		    HttpSession session = request.getSession();
			EmployeeInfotable em = (EmployeeInfotable) session.getAttribute("em");
			// 获得当前用户ID
			String employeeId = em.getEmployeeId();
			InstoreInfoDao  iid=new InstoreInfoDao();
		    String stockInId=(String)request.getParameter("stockInId");
		    String goodsName=(String)request.getParameter("select");
		    goodsName = new String(goodsName.getBytes("ISO-8859-1"),"gbk");
		    System.out.println("============"+goodsName);
		    int goodsNum=Integer.parseInt(request.getParameter("goodsNum"));
		    System.out.println("============"+goodsNum);
		    String goodsId=goodsinfoDao.getgoodsId(goodsName);
		    System.out.println("============"+goodsId);
		    double volumeofgoods=goodsinfoDao.getvolumeofgoods(goodsName);
		    String suppliersId=goodsinfoDao.getsupplierId(goodsName);
		    String districtName=goodsstockDao.getdistrictName(goodsId);
		    double freeVolum=iid.getfreeVolume(districtName);
		    double newfreeVolum=freeVolum-volumeofgoods*goodsNum;
		    iid.updategoodsNum(newfreeVolum, districtName);
		    int oldgoodsNum=goodsstockDao.getgoodsNum(goodsId);
		    int newgoodsNum=goodsNum+oldgoodsNum;
		    goodsstockDao.updategoodsNum(goodsId, newgoodsNum);
		    System.out.println("=============="+newgoodsNum);
		    String sdocmadetime = new SimpleDateFormat("yyyyMMddHHmmss").format(Calendar.getInstance().getTime());
		    userDao.addStockIo(stockInId,goodsId,suppliersId,employeeId,goodsNum, sdocmadetime);
		    return mapping.findForward("addStockIo");
		}
	public ActionForward addStockOut(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		    StockIninDao userDao = new StockIninDao();
		    GoodsInfoDao goodsinfoDao=new GoodsInfoDao();
		    GoodsStockDao goodsstockDao=new GoodsStockDao();
		    HttpSession session = request.getSession();
			EmployeeInfotable em = (EmployeeInfotable) session.getAttribute("em");
			// 获得当前用户ID
			String employeeId = em.getEmployeeId();
			InstoreInfoDao  iid=new InstoreInfoDao();
		    String stockOutId=(String)request.getParameter("stockOutId");
		    String goodsName=(String)request.getParameter("select");
		    String clientName=(String)request.getParameter("selectclient");
		    String state=(String)request.getParameter("state");
		    try{
		      goodsName = new String(goodsName.getBytes("ISO-8859-1"),"gbk");
		      clientName = new String(clientName.getBytes("ISO-8859-1"),"gbk");
		      state = new String(state.getBytes("ISO-8859-1"),"gbk");
		    }catch(Exception e)
		    {e.printStackTrace();}
		    System.out.println("=============="+state);
		    int goodsNum=Integer.parseInt(request.getParameter("goodsNum"));
		    String goodsId=goodsinfoDao.getgoodsId(goodsName);
		    double volumeofgoods=goodsinfoDao.getvolumeofgoods(goodsName);
		    String clientId=goodsinfoDao.getclientId(clientName);
		    String districtName=goodsstockDao.getdistrictName(goodsId);
		    double freeVolum=iid.getfreeVolume(districtName);
		    double newfreeVolum=freeVolum+volumeofgoods*goodsNum;
		    iid.updategoodsNum(newfreeVolum, districtName);
		    int oldgoodsNum=goodsstockDao.getgoodsNum(goodsId);
		    int newgoodsNum=oldgoodsNum-goodsNum;
		    System.out.println("newgoodsNum=================="+newgoodsNum);
		    if(newgoodsNum<0)
		    {
		    	throw new AppException("outof_error");
		    }
		    goodsstockDao.updategoodsNum(goodsId, newgoodsNum);
		    System.out.println("over===============");
		    String employeeapprovaltime=null;
		    String sdocmadetime = new SimpleDateFormat("yyyyMMddHHmmss").format(Calendar.getInstance().getTime());
		    if(state.equals("已处理"))
		    {
		    	employeeapprovaltime= sdocmadetime;
		    }
		    InvoiceInfotable iit=new InvoiceInfotable(stockOutId,goodsId,clientId,employeeId,goodsNum, sdocmadetime,employeeapprovaltime,state);
		    userDao.addStockOut(iit);
			return mapping.findForward("success2");
		}
	public ActionForward viewstockinoperation(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		    StockIninDao userDao = new StockIninDao();
			ArrayList list =userDao.viewStockIo();
			request.setAttribute("list", list);
			System.out.println("======================cccccccccccccccc");
			return mapping.findForward("viewstockinoperation");
	}
	public ActionForward viewstockoperation(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		    StockIninDao userDao = new StockIninDao();
			ArrayList list =userDao.viewStockOut();
			request.setAttribute("list", list);
			System.out.println("======================cccccccccccccccc");
			return mapping.findForward("viewstockoperation");
		}
	public ActionForward viewpdoperation(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
			OperaterecordDao userDao = new OperaterecordDao();
			ArrayList list =userDao.all();
			request.setAttribute("list", list);
			System.out.println("======================cccccccccccccccc");
			return mapping.findForward("viewpdoperation");
		}
	public ActionForward allin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
	    StockIninDao userDao = new StockIninDao();
		ArrayList list =userDao.viewin();
		request.setAttribute("list", list);
		return mapping.findForward("allin");

	}
	public ActionForward updin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		String goods = request.getParameter("goodsId");
		
	    StockIninDao userDao = new StockIninDao();
		boolean b = userDao.upd(goods);
		System.out.println("++++++++");
		if (b){
			return mapping.findForward("updin");
		}
		return null;
	}
}