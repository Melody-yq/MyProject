package com.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.bean.Product;
import com.utils.C3P0Utils;

public class ProductDao {
	// 增
	public void insertToProduct(String name, String price, String superprice) {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "insert into form(name,price,superprice) values(?,?,?)";
		try {
			qr.update(sql, name, price, superprice);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
//删除
	public void deleteProduct(int id) {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "delete from form where id=?";
		try {
			qr.update(sql, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
//查询
	public Product selectProduct(int id) {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select id,name,price,superprice from form where id=?";
		try {
			return qr.query(sql, new BeanHandler<Product>(Product.class), id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
//改
	public void updateProduct(int id, String name, String price,
			String superprice) {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "update form set name=?,price=?,superprice=? where id=?";
		try {
			qr.update(sql, name, price, superprice, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 查一页数据的方法
	public long selectProductCount() {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select count(*) from form";
		try {
			return (long) qr.query(sql, new ScalarHandler());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	// 查这一页数据的每一个
	public List<Product> selectPage(int pageSize, int pageNo) {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select  id,name,price,superprice from form limit ?,?";
		try {
			return qr.query(sql, new BeanListHandler<Product>(Product.class),
					(pageNo - 1) * pageSize, pageSize);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

}
