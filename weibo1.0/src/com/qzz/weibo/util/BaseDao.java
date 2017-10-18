package com.qzz.weibo.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

/**
 * 锟斤拷锟捷匡拷锟斤拷锟斤拷母锟斤拷锟斤拷锟�
 */
public class BaseDao {

	private static final String DRIVER = "oracle.jdbc.OracleDriver";
//	private static final String URL = "jdbc:oracle:thin:@192.168.9.223:1521:orcl";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:orcl01";
	private static final String USER = "scott"; // 锟矫伙拷锟斤拷
//	private static final String PASSWORD = "jie6846947";// 锟斤拷锟斤拷
	private static final String PASSWORD = "jia";// 锟斤拷锟斤拷

	/**
	 * 锟斤拷取锟斤拷锟接讹拷锟斤拷
	 * 
	 * @return 锟斤拷锟接讹拷锟斤拷
	 */
	public static Connection getConn() {

		Connection conn = null;
		try {

			Class.forName(DRIVER);
			// 锟矫碉拷锟斤拷锟接讹拷锟斤拷
			conn = DriverManager.getConnection(URL, USER, PASSWORD);

		} catch (Exception e) {
			throw new RuntimeException("锟斤拷锟捷匡拷锟斤拷锟斤拷失锟斤拷!", e);
		}
		return conn;
	}

	/**
	 * 锟酵凤拷锟斤拷源
	 * 
	 * @param rs
	 *            锟斤拷锟斤拷锟�
	 * @param pstmt
	 *            锟斤拷锟筋处锟斤拷锟斤拷锟�
	 * @param conn
	 *            锟斤拷锟接讹拷锟斤拷
	 */
	public static void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			throw new RuntimeException("锟酵凤拷锟斤拷源失锟斤拷!", e);
		}
	}

	/**
	 * 锟斤拷锟矫诧拷锟斤拷
	 * 
	 * @param sql
	 * @param conn
	 * @param pstmt
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	private static PreparedStatement setPstmt(String sql, Connection conn, PreparedStatement pstmt, Object... param)
			throws SQLException {
		pstmt = conn.prepareStatement(sql);
		if (param != null) {
			for (int i = 0; i < param.length; i++) {
				pstmt.setObject(i + 1, param[i]);
			}
		}
		return pstmt;
	}

	/**
	 * 通锟矫碉拷锟斤拷锟捷匡拷(锟斤拷,删,锟斤拷)锟斤拷锟斤拷锟斤拷锟斤拷
	 * 
	 * @param sql
	 *            sql锟斤拷锟�
	 * @param param
	 *            sql锟斤拷锟斤拷锟斤拷
	 * @return 锟斤拷影锟斤拷锟斤拷锟斤拷
	 */
	public static int execute(String sql, Object... param) {
		Connection conn = getConn();
		try {
			return execute(sql, conn, param);
		} finally {
			close(null, null, conn);
		}
	}

	/**
	 * 通锟矫碉拷锟斤拷删锟侥诧拷锟斤拷(锟斤拷锟斤拷锟斤拷锟�)
	 * 
	 * @param sql
	 * @param conn
	 * @param param
	 * @return
	 */
	public static int execute(String sql, Connection conn, Object... param) {
		PreparedStatement pstmt = null;
		try {
			pstmt = setPstmt(sql, conn, pstmt, param);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			// 锟斤拷锟斤拷锟斤拷玫玫锟斤拷斐ｏ拷锟较�
			e.printStackTrace();
			throw new RuntimeException("锟斤拷锟捷匡拷锟斤拷锟绞э拷锟�!", e);
		} finally {
			close(null, pstmt, null);
		}
	}

	/**
	 * 通锟矫诧拷询锟斤拷锟斤拷
	 * 
	 * @param sql
	 *            要锟斤拷询锟斤拷sql锟斤拷锟�
	 * @param cla
	 *            Class锟斤拷锟斤拷
	 * @param param
	 *            锟斤拷锟斤拷
	 * @return
	 */
	public static Object select(String sql, Class cla, Object... param) {
		Connection conn = getConn();
		try {
			return select(sql, conn, cla, param);
		} finally {
			close(null, null, conn);
		}
	}

	/**
	 * 锟斤拷锟斤拷锟斤拷牟锟窖拷锟斤拷锟�
	 * 
	 * @param sql
	 * @param conn
	 * @param cla
	 * @param param
	 * @return
	 */
	public static Object select(String sql, Connection conn, Class cla, Object... param) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		List<Object> list = new ArrayList<Object>();
		try {
			pstmt = setPstmt(sql, conn, pstmt, param);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// ?rs 锟斤拷锟斤拷锟� cla Class锟斤拷锟斤拷
				// object锟斤拷实锟斤拷锟斤拷锟斤拷锟捷憋拷峁癸拷锟接︼拷锟揭伙拷锟绞碉拷锟斤拷录,object锟斤拷锟斤拷锟角革拷实锟斤拷锟斤拷锟斤拷锟�
				// 锟斤拷锟斤拷锟斤拷锟絚onvert锟角斤拷锟斤拷锟斤拷锟斤拷锟絚la锟斤拷锟斤拷锟斤拷锟阶拷锟�
				Object object = convert(rs, cla);
				list.add(object);
			}
			return list;
		} catch (SQLException e) {
			throw new RuntimeException("锟斤拷锟捷匡拷锟窖э拷锟�!", e);
		} finally {
			close(rs, pstmt, null);
		}
	}

	/**
	 * 锟斤拷取锟斤拷锟斤拷锟斤拷录值,锟角碉拷锟斤拷锟斤拷录注锟斤拷,锟斤拷锟斤拷count(1)
	 * 
	 * @param sql
	 * @param param
	 * @return
	 */
	public static Object getFirst(String sql, Object... param) {
		Connection conn = getConn();
		try {
			return getFirst(sql, conn, param);
		} finally {
			close(null, null, conn);
		}
	}

	/**
	 * 锟斤拷取锟斤拷锟斤拷锟斤拷录 锟斤拷锟斤拷
	 * 
	 * @param sql
	 * @param conn
	 * @param param
	 * @return
	 */
	public static Object getFirst(String sql, Connection conn, Object... param) {
		List list = (List) select(sql, conn, Object.class, param);
		if (list.isEmpty()) {
			return null;
		}
		return list.get(0);
	}

	/**
	 * 锟斤拷锟斤拷锟斤拷锟斤拷锟�
	 * 
	 * @param tran
	 * @return
	 */
	public static Object transaction(ITransaction tran) {
		Connection conn = getConn();
		try {
			conn.setAutoCommit(false);
			Object obj = tran.execute(conn);
			conn.commit();
			return obj;
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				throw new RuntimeException("锟截癸拷失锟斤拷!", e);
			}
			throw new RuntimeException("锟斤拷锟斤拷执锟斤拷失锟斤拷", e);
		} finally {
			close(null, null, conn);
		}
	}

	/**
	 * 锟斤拷询锟斤拷锟斤拷锟阶拷锟�
	 * 
	 * @param rs
	 * @param cla
	 * @return
	 */
	public static Object convert(ResultSet rs, Class cla) {
		try {
			if (cla.getName().equals("java.lang.Object")) {
				return rs.getObject(1);
			}
			// 锟斤拷锟斤拷实锟斤拷锟斤拷锟绞碉拷锟� Class锟斤拷锟斤拷锟侥凤拷锟斤拷锟斤拷锟斤拷锟斤拷指锟斤拷锟斤拷锟斤拷锟绞碉拷锟�
			// new Goods(); new News(); new person(); new Users();
			Object object = cla.newInstance();
			//// 锟斤拷锟斤拷锟酵凤拷锟较拷锟斤拷锟�
			ResultSetMetaData metaData = rs.getMetaData();
			// 循锟斤拷为实锟斤拷锟斤拷锟绞碉拷锟斤拷锟斤拷锟斤拷愿锟街� getColumnCount锟矫碉拷锟叫的革拷锟斤拷
			for (int i = 1; i <= metaData.getColumnCount(); i++) {
				// 锟斤拷取锟斤拷锟斤拷
				String name = metaData.getColumnLabel(i);
				//// 注锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷一锟铰★拷锟斤拷锟斤拷锟窖拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟�. rs.getObject(i) 锟斤拷锟斤拷锟斤拷械牟锟窖拷锟斤拷锟酵讹拷锟斤拷匹锟斤拷
				BeanUtils.setProperty(object, name, rs.getObject(i));
			}
			return object;
		} catch (Exception e) {
			throw new RuntimeException("锟斤拷锟斤拷锟斤拷锟斤拷失锟斤拷!", e);
		}
	}

	/**
	 * 锟斤拷页锟斤拷锟斤拷 mysql;
	 * 
	 * @param sql
	 *            锟斤拷询锟斤拷sql锟斤拷锟�
	 * @param page
	 *            锟斤拷前页锟斤拷
	 * @param pageSize
	 *            每页锟斤拷示锟侥硷拷录锟斤拷
	 * @param cla
	 *            Class锟斤拷锟斤拷锟�
	 * @param param
	 *            sql锟叫关的诧拷锟斤拷锟叫憋拷
	 * @return PageData 锟斤拷锟斤拷
	 */
	public static PageData getPage(String sql, Integer page, Integer pageSize, Class cla, Object... param) {
		// sql select * from news
		// select count(1) from (select * from news) t --锟矫碉拷锟斤拷录锟斤拷锟斤拷
		String selSql = "select count(1) from (" + sql + ") t";
		if (page == null) {
			page = 1;
		}
		if (pageSize == null) {
			pageSize = 10;
		}
		// 锟斤拷询锟矫碉拷锟杰硷拷录锟斤拷
		Integer count = Integer.parseInt(getFirst(selSql, param).toString());
		// 实锟街简单的凤拷页锟斤拷锟�
		// select * from news limit 锟斤拷始位锟斤拷,每页锟斤拷示锟侥硷拷录锟斤拷
		// select * from news limit 锟斤拷始位锟斤拷,pageSize
		// select * from news limit 10,5 每页5锟斤拷锟斤拷录 锟斤拷锟斤拷示锟斤拷3页
		int start = (page - 1) * pageSize; // 锟斤拷始位锟斤拷锟姐法
		// + 锟斤拷实锟斤拷太锟斤拷 锟斤拷锟斤拷锟絪tringBuffer stringBuilder append
		sql = sql + " limit " + start + "," + pageSize;
		List list = (List) select(sql, cla, param);
		// 锟斤拷锟斤拷一锟斤拷PageData锟斤拷锟斤拷
		PageData data = new PageData(list, count, pageSize, page);
		return data;
	}

	/**
	 * 锟斤拷页锟斤拷锟斤拷 sqlserver
	 * 
	 * @param page
	 * @param pageSize
	 * @param cla
	 * @param identity
	 * @return
	 */
	public static PageData getPage(Integer page, Integer pageSize, Class cla, String identity) {
		String name = cla.getName().substring(cla.getName().lastIndexOf(".") + 1);// 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟饺★拷锟斤拷菘锟斤拷锟斤拷
		String selSql = "select count(1) from " + name;// 锟斤拷取锟斤拷锟斤拷
		if (page == null) {
			page = 1;
		}
		if (pageSize == null) {
			pageSize = 20;
		}
		int start = (page - 1) * pageSize;
		Integer count = Integer.parseInt(getFirst(selSql, null).toString());
		selSql = "select top " + pageSize + " * from " + name + " where " + identity + " not in (select top " + start
				+ " " + identity + " from " + name + " )"; // 拼锟接诧拷询锟斤拷锟�
		List list = (List) select(selSql, cla, null);
		PageData data = new PageData(list, count, pageSize, page);
		return data;
	}

	public static PageData oracleGetPage(String sql, Integer page, Integer pageSize, Class cla, Object... param) {
		// sql select * from news
		
		// 实锟街简单的凤拷页锟斤拷锟�
		if (page == null) {
			page = 1;
		}
		if (pageSize == null) {
			pageSize = 10;
		}
		
		int start = (page - 1) * pageSize; // 锟斤拷始位锟斤拷锟姐法
		int end = pageSize*page+1;
		sql = sql + end + ") tt where r>" + start;
		
		// select count(1) from (select * from news) t --锟矫碉拷锟斤拷录锟斤拷锟斤拷
		String selSql = "select count(1) from (" + sql + ") t";
		
		
		List list = (List) select(sql, cla, param);
		// 锟斤拷询锟矫碉拷锟杰硷拷录锟斤拷
		Integer count = Integer.parseInt(getFirst(selSql, param).toString());

		// 锟斤拷锟斤拷一锟斤拷PageData锟斤拷锟斤拷
		PageData data = new PageData(list, count, pageSize, page);
		return data;
	}
}
