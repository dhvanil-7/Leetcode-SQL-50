SELECT 
    st.student_id,
    st.student_name,
    sub.subject_name,
    count(e.subject_name) as attended_exams
FROM students st
CROSS JOIN subjects sub
LEFT JOIN examinations e
    ON st.student_id = e.student_id
    AND e.subject_name = sub.subject_name
GROUP BY st.student_id, st.student_name, sub.subject_name
ORDER BY st.student_id, st.student_name
