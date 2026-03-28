package kr.or.ddit.controller.util;

import jakarta.annotation.Nullable;
import org.springframework.http.MediaType;
import org.springframework.util.FileCopyUtils;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class UploadFileUtils {

    private static Map<String, MediaType> mediaMap;

    // static 그룹선언, mediaMap 해시맵 초기화(데이터 추가)
    static{
        mediaMap = new HashMap<>();
        mediaMap.put("JPG", MediaType.IMAGE_JPEG);
        mediaMap.put("PNG", MediaType.IMAGE_PNG);
        mediaMap.put("GIF", MediaType.IMAGE_GIF);
    }

    /**
     * @param formatName
     * @return mediaMap.value
     */
    public static MediaType getMediaType(String formatName) {
        return mediaMap.get(formatName.toUpperCase());
    }

    // String... 은 가변인자 => 컴파일러가 호출 시점의 인수들을 모아 자동으로 배열 형태를 만들어줌
    // method(int num, String... Alphabet) => method(3, spring, boot, project) => method(3, string[3])
    private static void makeDir(String uploadPath, String yearPath, String... paths) {
        // 이미 경로가 존재하는지 확인
        if (new File(uploadPath + paths[paths.length - 1]).exists()) {
            return;
        }

        // 경로가 없으면 paths로 만든다
        for (String path : paths) {
            File dirPath = new File(uploadPath + path);

            if (!dirPath.exists()) {
                dirPath.mkdirs();
            }
        }
    }

    // yyyy/MM/dd 경로 생성
    private static String calcPath(String uploadPath) {
        // Calendar 클래스 사용
        Calendar cal = Calendar.getInstance();

        String yearPath = File.separator + cal.get(Calendar.YEAR);  // 경로 yyyy

        String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);

        // 년 월 구조 폴더 생성
        makeDir(uploadPath, yearPath, monthPath);


        return monthPath;
    }

    /**
     * 1. '/년/월' 폴더 경로를 만들고, 해당 경로를 리턴받는다.
     * 2. 업로드 경로 + /년/ + UUID_원본파일명 형태로 파일 복사.
     * 3. 업로드 한 파일이 이미지라면 's_'가 붙은 썸네일 이미지를 만든다.
     * @param uploadPath
     *        - application_property에 지정된 경로 (C:/upload)
     */
    public static String uploadFile(String uploadPath, @Nullable String originalFileName, byte[] bytes) {
        // <UUID_원본명>으로 파일명 설정
        String savedName = UUID.randomUUID().toString() + "_" + originalFileName;

        // yyyy/MM/ 포맷으로 폴더 경로를 만들고 리턴한다
        String savedPath = calcPath(uploadPath);

        // 만들어진 경로와 파일명을 이용해 파일(업로드 타겟) 객체 생성
        File target = new File(uploadPath + savedName);
        try {
            FileCopyUtils.copy(bytes, target);  // 스프링 내장 클래스 static 메서드, 파일 복사
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        // OS 환경에 따라 calcPath()가 경로 구분자를 '\' 또는 '/'로 만들어서 파일마다 구분자가 제각각일 수 있다
        // 때문에 '/'로 통일한다. 또한 웹 브라우저나 DB에서는 '/'를 써야 호환돼서 문제가 안생긴다.
        String uploadedFileName = savedPath.replace(File.separatorChar,'/') + "/" + savedName;

        String formatName = originalFileName.substring(originalFileName.lastIndexOf(".")+1);

        return uploadedFileName;
    }
}
