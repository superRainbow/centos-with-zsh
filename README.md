# centos-with-zsh

---

## 前言
```
此 Dockfile 是在 centos 上加載 zsh

在執行前，請先在本地端安裝好 docker & centos
```

---

## 執行 Dockerfile 自建 image

### 指令
```
docker build -t centos-with-zsh:v1 .
```

### 注意
```
測試 image 是不是自己預期的
    - 假如 build 沒問題且建立 container 也是預期：恭喜完成
    - 假如不符合期待，要移除剛剛建立 image：
        1. 查詢本地安裝的 image：docker image ls
        2. 複製要刪除的 image id
        3. 移除 image：docker image rm image_id
```

---

## 建立 Container 並執行

### 指令
```
docker run -it --name centos centos-with-zsh
```

### 補充
```
- 離開 container：exit
- 重啟 container
    - 檢查所有含終止狀態的容器：docker ps -a
    - 重啟：docker container restart 3701fa0e4488;docker exec -it 3701fa0e4488 /bin/zsh;
```

---

## Push 到 Docker Hub
```
docker tag [OPTIONS] IMAGE[:TAG] [REGISTRYHOST]/[USERNAME]/NAME[:TAG]
docker login
docker push NAME[:TAG]


ex:
docker tag 518a41981a6a myRegistry.com/myImage
docker login
docker push myRegistry.com/myImage
```

---

## 測試從遠端拉下來
```
# 移除本地端
docker rmi -f superrainbow/centos-with-zsh
docker rmi -f centos-with-zsh

docker pull superrainbow/centos-with-zsh
```