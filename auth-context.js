import { createContext, useState } from "react";

export const AuthContext = createContext(
    {
        participantid: '',
        studyid: '',
        isAuthenticated: false,
        login: () => {},
        logout: () => {}
    }
);

function AuthProvider({ children }) {
    const [isAuthenticated, setIsAuthenticated] = useState(false);
    const [participantid, setParticipantid] = useState('');
    const [studyid, setStudyid] = useState('');
  
    const login = (participant, study) => {
      setIsAuthenticated(true);
      setParticipantid(participant);
      setStudyid(study);
    };
  
    const logout = () => {
      setIsAuthenticated(false);
      setParticipantid("");
      setStudyid("");
    };
  
    return (
      <AuthContext.Provider value={{ participantid, studyid, isAuthenticated, login, logout }}>
        {children}
      </AuthContext.Provider>
    );
  };

  export default AuthProvider;

