/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.yourcompany.struts.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.yourcompany.struts.dao.GoodsInfoDao;
import com.yourcompany.struts.dao.GoodsStockDao;

/** 
 * MyEclipse Struts
 * Creation date: 07-21-2010
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class GoodsstockAction extends DispatchAction {
	/*
	 * Generated Methods
	 */

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward allgoodsstock(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
			GoodsStockDao goodsStockDao=new GoodsStockDao();
	        ArrayList al = goodsStockDao.all();
			request.setAttribute("al", al);
		    return mapping.findForward("allgoodsstock");
		}
	
	public ActionForward delgoodsstock(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		String goods = request.getParameter("goodsId");
		
		GoodsStockDao goodsStockDao=new GoodsStockDao();
		boolean b = goodsStockDao.del(goods);
		System.out.println("++++++++");
		if (b){
			return mapping.findForward("delgoodsstock");
		}
		return null;
	}
	
}