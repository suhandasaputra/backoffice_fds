/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mdw.db;

import javax.sql.DataSource;

/**
 *
 * @author herry.suganda
 */
public class DatasourceEntry {

    private static DatasourceEntry log = null;
    private DataSource postgreDS = null;
    
    public DatasourceEntry() {
        
    }

    public static DatasourceEntry getInstance() {
        if (log == null) {
            log = new DatasourceEntry();
        }

        return log;
    }

    /**
     * @return the postgreDS
     */
    public DataSource getPostgreDS() {
        return postgreDS;
    }

    /**
     * @param postgreDS the postgreDS to set
     */
    public void setPostgreDS(DataSource postgreDS) {
        this.postgreDS = postgreDS;
    }

}
