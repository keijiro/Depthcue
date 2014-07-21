using UnityEngine;
using System.Collections;

public class StenciledMask : MonoBehaviour
{
    public Texture mask;
    public Texture pattern;

    Material material;

    void Awake()
    {
        material = new Material(Shader.Find("Hidden/Stenciled Mask"));
    }

    void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        material.SetTexture("_MaskTex", mask);
        material.SetTexture("_PatternTex", pattern);
        Graphics.Blit(source, destination, material);
    }
}
