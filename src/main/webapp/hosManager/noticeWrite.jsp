<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <title>마음이음 - 공지사항 작성</title>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#noticeFile").on("change", function (e) {
                    var fileName = e.target.files[0].name;
                    console.log(fileName);
                    $(".upload-file-name").text(fileName);
                    $(".upload-file-name").show();
                });
            });
        </script>
        <link rel="stylesheet" href="./noticeWrite.css" />
        <link rel="stylesheet" href="./managerHeader.css" />
    </head>

    <body>
        <div class="main">
            <div class="main-div">
                <div class="under-section">
                    <jsp:include page="managerHeader.html"></jsp:include>
                    <div class="info">
                        <div class="notice-container">
                            <!-- 제목 -->
                            <div class="form-group">
                                <div class="form-label">제목</div>
                                <input type="text" class="form-input" name="title" placeholder="제목을 입력하세요" value="${notice.title}" />
                            </div>

                            <!-- 작성자 -->
                            <div class="form-group">
                                <div class="form-label">작성자</div>
                                <div class="form-value">${notice.writer}</div>
                            </div>

                            <!-- 내용 -->
                            <div class="form-group">
                                <div class="form-label">내용</div>
                                <textarea class="form-textarea" name="content" placeholder="내용을 입력하세요">${notice.content}</textarea>
                            </div>

                            <div class="notice-footer">
                                <!-- 첨부파일 -->
                                <div class="file">
                                    <label class="file-upload" for="noticeFile">이미지 / 문서 첨부</label>

                                    <!-- 기존에 업로드된 파일이 있다면 파일명 보여주기 -->
                                    <span class="upload-file-name"> ${not empty notice.fileName ? notice.fileName : "첨부된 파일 없음"} </span>

                                    <input class="file-input" type="file" name="noticeFile" id="noticeFile" />
                                </div>
                                <!-- 버튼 -->
                                <div class="button-wrapper">
                                    <a class="btn-link" href="/notice/list">
                                        <div class="basic-small-btn">취소</div>
                                    </a>
                                    <button type="submit" class="primary-small-btn">${mode eq 'edit' ? '수정' : '작성'}</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- <jsp:include page="../footer.html"></jsp:include> --%>
            </div>
        </div>
        <script src="./managerHeader.js"></script>
    </body>
</html>
