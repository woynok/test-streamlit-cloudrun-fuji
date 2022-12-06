# streamlitをCloud Run for Anthosで実行する

## Cloud RunからCloud Run for Anthosへ乗り換えた経緯

Cloud Runだと下記がうまくいかない

- 32 MiB/requestの制限回避ができない
  - HTTP2に設定しても…
    - healthzのトラブル(？)が回避できず
- xx

## cluster作成

```bash
gcloud beta container clusters create test-anthos-from-cli \
--addons=HorizontalPodAutoscaling,HttpLoadBalancing,Istio,CloudRun \
--region=asia-northeast1-a \
--machine-type=n1-standard-4 \
--cluster-version=1.22
--enable-stackdriver-kubernetes \
--scopes cloud-platform 
```
