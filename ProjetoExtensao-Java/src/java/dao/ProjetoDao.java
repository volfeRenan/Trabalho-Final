package dao;

import model.Projeto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ProjetoDao {
    
    private Connection con = null;
    
    public ProjetoDao() {
        con = Conexao.getConnection();
    }
    
    public void salvarProj(Projeto projeto){
        String sql = "INSERT INTO projeto(nomeProj, objGeral, objEspe, professor, curso) VALUE(?, ?, ?, ?, ?)";
        PreparedStatement stmt = null;
                
        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, projeto.getNomeProj());
            stmt.setString(2, projeto.getObjGerProj());
            stmt.setString(3, projeto.getObjEspProj());
            stmt.setString(4, projeto.getProfessor());
            stmt.setString(5, projeto.getCurso());
            
            stmt.execute();
            
        } catch (SQLException ex) {
            throw new RuntimeException("Erro 2: " + ex);
        }finally{
            Conexao.closeConnection(con, stmt);
        }
    }
    
    public ArrayList<Projeto> listarProjeto(){
        String sql = "SELECT * FROM projeto ORDER BY idProj DESC;";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        ArrayList<Projeto> projetos = new ArrayList<>();
        
        try {
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();
            
            while(rs.next()){
                Projeto proj = new Projeto();
                
                proj.setIdProj(rs.getInt("idProj"));
                proj.setNomeProj(rs.getString("nomeProj"));
                proj.setObjGerProj(rs.getString("objGeral"));
                proj.setObjEspProj(rs.getString("objEspe"));
                proj.setProfessor(rs.getString("professor"));
                proj.setCurso(rs.getString("curso"));
               
                projetos.add(proj);
            }
            
        } catch (SQLException ex) {
            throw new RuntimeException("Erro 3: " + ex);
        }finally{
            Conexao.closeConnection(con, stmt, rs);
        }
        return projetos;
    }
    
    public ArrayList<Projeto> detalhesProjeto(int valor){
        String sql = "SELECT * FROM projeto WHERE idProj=" + valor;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        ArrayList<Projeto> projetos = new ArrayList<>();
        
        try {
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();
            
            while(rs.next()){
                Projeto proj = new Projeto();
                
                proj.setIdProj(rs.getInt("idProj"));
                proj.setNomeProj(rs.getString("nomeProj"));
                proj.setObjGerProj(rs.getString("objGeral"));
                proj.setObjEspProj(rs.getString("objEspe"));
                proj.setProfessor(rs.getString("professor"));
                proj.setCurso(rs.getString("curso"));
               
                projetos.add(proj);
            }
            
        } catch (SQLException ex) {
            throw new RuntimeException("Erro 6: " + ex);
        }finally{
            Conexao.closeConnection(con, stmt, rs);
        }
        return projetos;
    }
    
    public void alterarProjeto(Projeto projeto){
        String sql = "UPDATE projeto SET nomeProj = ?, objGeral = ?, objEspe = ?, professor = ?, curso = ? WHERE idProj = ? ";
        PreparedStatement stmt = null;       
        
        try {
            stmt = con.prepareStatement(sql);
            
            stmt.setString(1, projeto.getNomeProj());
            stmt.setString(2, projeto.getObjGerProj());
            stmt.setString(3, projeto.getObjEspProj());
            stmt.setString(4, projeto.getProfessor());
            stmt.setString(5, projeto.getCurso());
            stmt.setInt(6, projeto.getIdProj());
            
            stmt.execute();
            
        } catch (SQLException ex) {
            throw new RuntimeException("Erro 8: " + ex);
        }finally{
            Conexao.closeConnection(con, stmt);
        }
    }
    
        public void deleteProjeto(int valor){
        String sqlPro = "DELETE FROM projeto WHERE idProj=" + valor;
        String sqlRel = "DELETE FROM relatorio WHERE fkProj=" + valor;
        Statement stmt = null;
        
        try{
            stmt = con.createStatement();
            stmt.execute(sqlPro);
            stmt.execute(sqlRel);
            stmt.close();
            
        }catch(SQLException error){
            throw new RuntimeException("Erro 12:" + error);
        }
    }
        
    public ArrayList<Projeto> consultaProjeto(String curso){
        String sql = "select * from projeto where curso = '"+curso+"'";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        ArrayList<Projeto> projetos = new ArrayList<>();
        
        try {
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();
            
            while(rs.next()){
                Projeto proj = new Projeto();
                
                proj.setIdProj(rs.getInt("idProj"));
                proj.setNomeProj(rs.getString("nomeProj"));
                proj.setObjGerProj(rs.getString("objGeral"));
                proj.setObjEspProj(rs.getString("objEspe"));
                proj.setProfessor(rs.getString("professor"));
                proj.setCurso(rs.getString("curso"));
               
                projetos.add(proj);
            }
            
        } catch (SQLException ex) {
            throw new RuntimeException("Erro 13: " + ex);
        }finally{
            Conexao.closeConnection(con, stmt, rs);
        }
        return projetos;
    }
    
}
