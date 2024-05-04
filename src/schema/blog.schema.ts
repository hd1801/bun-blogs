import * as yup from "yup";
const tagSchema = yup.object({
  name: yup.string().required(),
});
export const blogSchema = yup.object({
  title: yup.string().required(),
  coverImage: yup.string().url().required(),
  tags: yup.array().of(tagSchema),
  content: yup.string().required(),
});

export type BlogDto = yup.InferType<typeof blogSchema>;
