package com.ht.api.framework;

import java.sql.Connection;
import java.sql.SQLException;
import com.alibaba.druid.pool.DruidDataSource;
import com.ht.api.entity.DataPool;

public class ConnectionPool{

    private final DruidDataSource dataSource;

    public ConnectionPool(DataPool dataPool) {
        dataSource = new DruidDataSource();
        dataSource.setUrl(dataPool.getConstr());
        dataSource.setUsername(dataPool.getUser());
        dataSource.setPassword(dataPool.getPwd());
        dataSource.setInitialSize(dataPool.getInisize());
        dataSource.setMaxActive(dataPool.getMaxactive());
        dataSource.setMinIdle(dataPool.getMinidle());
        dataSource.setMaxWait(dataPool.getMaxwait());
        dataSource.setTestOnBorrow(true);
        dataSource.setValidationQuery("SELECT 1 FROM DUAL");
    }

    public Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }

    public void releaseConnection(Connection connection) throws SQLException {
        connection.close();
    }

}
